class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :description, presence: true
  validates :photo_url, presence: true
  validates :link_url, presence: true
  has_many :combos, dependent: :destroy
end
