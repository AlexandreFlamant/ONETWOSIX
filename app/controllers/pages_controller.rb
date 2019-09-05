class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @fresh_combos = Combo.order(cached_votes_total: :desc).first(25)
  end

  def search
    @location = params.dig(:search, :query)
    respond_to do |format|
      format.js
    end
  end
end
