class Genre < ApplicationRecord
  GENRE_CATEGORIES = %w(documentary family romance cult sci-fi)

  validates :name, presence: true, inclusion: { in: GENRE_CATEGORIES }
  validates :photo_url, presence: true

  has_many :movies, dependent: :destroy
end
