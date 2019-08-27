class Restaurant < ApplicationRecord
  FOODTYPE_CATEGORIES = %w(chinese sushi fish&chips chicken shawarma)

  validates :name, presence: true, uniqueness: true
  validates :food_type, presence: true, inclusion: { in: FOODTYPE_CATEGORIES }
  validates :photo_url, presence: true
  validates :link_url, presence: true
  has_many :combo_selections, dependent: :destroy
end
