class Restaurant < ApplicationRecord
  # FOODTYPE_CATEGORIES = %w(chinese sushi fish&chips chicken shawarma)

  validates :name, presence: true, uniqueness: true
  # validates :food_type, presence: true, inclusion: { in: FOODTYPE_CATEGORIES }
  validates :photo_url, presence: true
  validates :link_url, presence: true
  has_many :combos, dependent: :destroy
  belongs_to :food_type

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # def self.get_food_type(food_type)
  #   self.all.where(food_type: food_type).first
  # end
end
