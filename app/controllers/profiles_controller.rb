class ProfilesController < ApplicationController
  def show
    @user_combos = current_user.find_voted_items
  end
end
