class Movie < ApplicationRecord
  GENRE_CATEGORIES = %w(animation documentary adventure comedy crime sci-fi)
  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true, inclusion: { in: GENRE_CATEGORIES }
  validates :description, presence: true
  validates :photo_url, presence: true
  validates :link_url, presence: true
  has_many :combos, dependent: :destroy
end
