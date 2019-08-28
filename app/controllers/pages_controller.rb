class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @selected_combos = Combo.all.sort_by { |combo| combo.votes_for.size }.reverse

  end

  def search
    @location = params.dig(:search, :query)
    respond_to do |format|
        format.js
    end
  end
end
