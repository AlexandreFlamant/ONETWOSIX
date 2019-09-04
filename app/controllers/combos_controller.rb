class CombosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :upvote, :refresh_save]

  def index
    location = params.dig(:location)
    postcode = params.dig(:location)
    genre = params.dig(:hidden_genre).downcase
    foodtype = params.dig(:hidden_foodtype).downcase
    begin
      response = RestClient.post('https://deliveroo.co.uk/api/restaurants', {location: {post_code: postcode, confirmed_on_map: false}}.to_json, { 'Content-Type': 'application/json' })
      response = JSON.parse(response.body)
    rescue
      return redirect_to root_path, notice: 'That postcode might be invalid!'
    end
    ScraperDeliveroo.new(postcode, foodtype, response['url']).call
    if postcode.present?
      restaurants = Restaurant.select { |r| foodtype.include?(r.food_type.name) }
      movies = Movie.select { |m| genre.include?(m.genre.name) }
      restaurants.each do |rest|
        movie = movies.pop
        unless movies.empty?
          combo_find = Combo.where(restaurant: rest, movie: movie)
          unless combo_find.any?
            new_combo = Combo.create(movie: movie, restaurant: rest)
          end
        end
      end
    end

    if session[:combo_ids].present?
      @combos = session[:combo_ids].map { |id| Combo.find(id) }
    else
      @combos = Combo.joins(:movie).merge(Movie.joins(:genre).merge(Genre.where(name: genre))).joins(:restaurant).merge(Restaurant.joins(:food_type).merge(FoodType.where(name: foodtype)))
    end

    unless session[:combo_ids].present?
      @sponsored_combos = SponsoredCombo.where(combo_id: @combos.ids)
      @non_sponsored_combos = @combos.where.not(id: @sponsored_combos.map(&:combo_id))
      if @sponsored_combos.any?
       @random_combos = [@sponsored_combos.sample.combo, @non_sponsored_combos.sample, @non_sponsored_combos.sample]
      else
       @random_combos = @combos.sample(3)
      end
    else
      @random_combos = @combos
    end
  end


  def new
    @combo = Combo.new
  end

  def upvote
    if user_signed_in?
      session[:combo_ids] = nil
      @combo = Combo.find(params[:id])
      @combo.liked_by current_user
      respond_to do |format|
        format.js
      end
    else
      session[:combo_ids] = params[:combo_ids].reject(&:empty?).map(&:to_i)
      flash[:alert] = 'You must sign in/sign up before continuing'
      redirect_to new_user_session_path
    end
  end

  def downvote
    @combo = Combo.find(params[:id])
    @combo.unliked_by current_user
    respond_to do |format|
      format.js
    end
  end
end
