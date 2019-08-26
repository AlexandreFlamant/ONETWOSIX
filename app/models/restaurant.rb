class Restaurant < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :food_type, presence: true
  validates :photo_url, presence: true, uniqueness: true
  has_many :combos
end
