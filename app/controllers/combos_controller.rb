class CombosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :upvote]

  def index
    # @combos = Combo.all
    location = params.dig(:location)
    if location.present?
      restaurants = Restaurant.where(food_type: params[:search][:foodtype].reject(&:empty?).first).near(location, 6).sort_by { |r| r.id }
    end
    movies = Movie.where(genre: params[:search][:genre].reject(&:empty?).first)
    if session[:combo_ids].present?
      @combos = session[:combo_ids].map { |id| Combo.find(id) }
    else
      @combos = Combo.where(movie: movies, restaurant: restaurants)
    end
  end

  def upvote
    if user_signed_in?
      session[:combo_ids] = nil
      @combo = Combo.find(params[:id])
      @combo.liked_by current_user
    else
      session[:combo_ids] = params[:combo_ids].reject(&:empty?).map(&:to_i)
      flash[:alert] = 'you must sign in/sign up before continuing'
      redirect_to new_user_session_path
    end
  end

  def downvote
    @combo = Combo.find(params[:id])
    @combo.downvote_from current_user
  end

  # def upvote_select
  #   @combo = Combo.find(params[:id])
  #   @combo.liked_by current_or_guest_user
  #   # redirect_back fallback_location: root_path
  # end
end



