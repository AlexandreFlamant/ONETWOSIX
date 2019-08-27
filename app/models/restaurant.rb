class Restaurant < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :food_type, presence: true
  validates :photo_url, presence: true
  validates :link_url, presence: true
  has_many :combo_selections, dependent: :destroy
end
