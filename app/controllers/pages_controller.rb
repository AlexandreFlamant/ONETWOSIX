class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def search
    @location = params.dig(:search, :query)
    respond_to do |format|
        format.js
    end
  end
end
