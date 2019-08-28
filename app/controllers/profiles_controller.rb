class ProfilesController < ApplicationController
  def show
    @user_combos = Combo.all.order(name: :asc).select { |combo| combo.liked_by current_user }
  end
end
