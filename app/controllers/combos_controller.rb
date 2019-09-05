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

    restaurants = ScraperDeliveroo.new(postcode, foodtype, response['url']).call
    if postcode.present?
      # start_time = Time.now
      # movies = Movie.all.select { |m| m.genre.name = genre}
      # end_time = Time.now
      # p 'TIME'
      # p (end_time - start_time)
      movies = Movie.joins(:genre).merge(Genre.where(name: genre))
        # movie = movies.pop
        # unless movies.empty?
      # combos = Combo.where(restaurant_id: restaurants.map(&:id), movie_id: movies.ids)
      # raise
      restaurants.take(13).each do |rest|
        movies.take(13).each do |movie|
          if Combo.find_by(movie: movie, restaurant: rest).nil?
            Combo.create(movie: movie, restaurant: rest)
          end
        end
      end
      @combotest = Combo.where(restaurant_id: restaurants.map(&:id), movie_id: movies.ids)
    end

    if session[:combo_ids].present?
      @combos = Combo.where(id: session[:combo_ids])
    else
      @combos = @combotest
    end

    unless session[:combo_ids].present?
      @sponsored_combos = SponsoredCombo.where(combo_id: @combos.ids)

      @non_sponsored_combos = @combos.where.not(id: @sponsored_combos.map(&:combo_id))

      if @sponsored_combos.any?
       @random_combos = [@sponsored_combos.sample.combo, *@non_sponsored_combos.sample(2)]
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
