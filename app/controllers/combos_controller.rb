class CombosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :upvote, :refresh_save]

  def index
    location = params.dig(:location)
    genre = params.dig(:hidden_genre).downcase
    foodtype = params.dig(:hidden_foodtype).downcase
    if location.present?
      restaurants = Restaurant.select { |r| foodtype.include?(r.food_type.name) }
      movies = Movie.select { |m| genre.include?(m.genre.name) }
      3.times do
        Combo.create(restaurant: restaurants.shuffle!.delete_at(-1), movie: movies.shuffle!.delete_at(-1))
      end
    end
    if session[:combo_ids].present?
      @combos = session[:combo_ids].map { |id| Combo.find(id) }
    else
      @combos = Combo.where(movie: movies, restaurant: restaurants)
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
