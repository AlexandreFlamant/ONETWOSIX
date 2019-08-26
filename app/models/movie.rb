class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :description, presence: true, uniqueness: true
  validates :photo_url, presence: true, uniqueness: true
  has_many :combos
end
