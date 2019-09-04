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
      @combotest = []
      movies = Movie.joins(:genre).merge(Genre.where(name: genre))
      restaurants.each do |rest|
        movies.each do |movie|
        # movie = movies.pop
        # unless movies.empty?
          combo_find = Combo.where(restaurant: rest, movie: movie)
          combo_find.each do |c|
            @combotest << c
          end
          unless combo_find.any?
            new_combo = Combo.create(movie: movie, restaurant: rest)
            @combotest << new_combo
          end
        end
      end
    end

    if session[:combo_ids].present?
      @combos = session[:combo_ids].map { |id| Combo.find(id) }
    else
      @combos = @combotest
    end

    unless session[:combo_ids].present?
      @sponsored_combos = []
      SponsoredCombo.all.each do |sc|
        @combos.each do |c|
          if sc.combo_id == c.id
          @sponsored_combos << sc
          end
        end
      end

      @non_sponsored_combos = []
      @combos.each do |c|
        SponsoredCombo.all.each do |sc|
          if c.id != sc.combo_id
          @non_sponsored_combos << c
          end
        end
      end

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
