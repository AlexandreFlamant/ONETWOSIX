class CombosController < ApplicationController
  def index
    @combos = Combo.all
  end

  def create
    @combo = Combo.new(combo_params)
    if @combo.save
      redirect_to profile_path
    end
  end

  private

  def combo_params
    params.require(:combo).permit(:name, :description, :food_type, :movie, :name_from_sponsor)
  end
end
