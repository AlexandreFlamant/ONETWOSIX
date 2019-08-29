class FoodType < ApplicationRecord
  FOODTYPE_CATEGORIES = %w(burgers sushi italian salad vietnamese)

  validates :name, presence: true, inclusion: { in: FOODTYPE_CATEGORIES }
  validates :photo_url, presence: true

  has_many :restaurants, dependent: :destroy
end
