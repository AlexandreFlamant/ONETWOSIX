class CombosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :upvote_select]

  def index
    # @combos = Combo.all
    location = params.dig(:location)
    if location.present?
      restaurants = Restaurant.where(food_type: params[:search][:foodtype].reject(&:empty?).first).near(location, 6).sort_by { |r| r.id }
    end
    movies = Movie.where(genre: params[:search][:genre].reject(&:empty?).first)
    @combos = Combo.where(movie: movies, restaurant: restaurants)
  end

  def upvote
    @combo = Combo.find(params[:id])
    @combo.liked_by current_user
  end

  # def upvote_select
  #   @combo = Combo.find(params[:id])
  #   @combo.liked_by current_or_guest_user
  #   # redirect_back fallback_location: root_path
  # end
end



