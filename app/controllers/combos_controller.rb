class CombosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :upvote_select]

  def index
    # @combos = Combo.all
    genre = Movie.where(genre: params[:search][:genre].reject(&:empty?).first)
    @combos = Combo.where(food_type: params[:search][:foodtype].reject(&:empty?).first, movie: genre)
    location = params.dig(:location)
      if location.present?
        @restaurants_geocode = Restaurant.geocoded.near(location, 10).where(food_type: params[:search][:foodtype].reject(&:empty?).first)
      end
  end

  def upvote
    @combo = Combo.find(params[:id])
    @combo.liked_by current_user
    redirect_back fallback_location: root_path
  end

  def upvote_select
    @combo = Combo.find(params[:id])
    @combo.liked_by current_or_guest_user
    # redirect_back fallback_location: root_path
  end

  # def create
  #   @combo = Combo.new(combo_params)
  #   if @combo.save
  #     redirect_to profile_path
  #   end
  # end

  # private

  # def combo_params
  #   params.require(:combo).permit(:name, :description, :food_type, :movie, :name_from_sponsor)
  # end
end
