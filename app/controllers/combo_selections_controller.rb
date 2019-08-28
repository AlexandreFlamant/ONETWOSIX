class ComboSelectionsController < ApplicationController

  def create
    @combo_selection = ComboSelection.new
  end
end
