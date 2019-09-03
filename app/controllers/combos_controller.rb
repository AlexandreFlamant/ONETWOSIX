class CombosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :upvote, :refresh_save]

  def index
    location = params.dig(:location)
    postcode = params.dig(:postcode)
    genre = params.dig(:hidden_genre).downcase
    foodtype = params.dig(:hidden_foodtype).downcase
    ScraperDeliveroo.new(postcode, foodtype).call
    if location.present?
      restaurants = Restaurant.select { |r| foodtype.include?(r.food_type.name) }
      movies = Movie.select { |m| genre.include?(m.genre.name) }
    end
    if session[:combo_ids].present?
      @combos = session[:combo_ids].map { |id| Combo.find(id)}
    else
      @combos = []
      movies = Movie.select { |m| genre == m.genre.name }
      restaurants.each do |rest|
        movie = movies.pop
        unless movies.empty?
          combo_find = Combo.find_by(name: "#{rest.name} + #{movie.name}")
          if combo_find.nil?
            new_combo = Combo.create(name: "#{rest.name} + #{movie.name}", description: movie.description, movie: movie, restaurant: rest)
          end
          if combo_find.nil?
            @combos << new_combo
          else
            @combos << combo_find
          end
        end
      end
      @combos
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
