class ProfilesController < ApplicationController
  def show
    @user_combos = Combo.all.order(name: :asc).select { |combo| current_user.voted_up_on? combo }
  end
end
