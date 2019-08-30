class Genre < ApplicationRecord
  GENRE_CATEGORIES = %w(family romance documentary cult sci-fi)

  validates :name, presence: true, inclusion: { in: GENRE_CATEGORIES }
  validates :photo_url, presence: true

  has_many :movies, dependent: :destroy
end
