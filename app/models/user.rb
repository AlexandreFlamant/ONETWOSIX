class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sponsored_combos, dependent: :destroy
  acts_as_voter

  # def got_sponsored_but_no_saved_card?
  #   self.sponsored_combos.present? && @user_combos.empty?
  # end

  # def got_saved_but_no_sponsored_card?
  #   self.sponsored_combos.empty? && @user_combos.present?
  # end

  # def got_both_sponsored_and_saved_card?
  #   self.sponsored_combos.present? && @user_combos.present?
  # end
end
