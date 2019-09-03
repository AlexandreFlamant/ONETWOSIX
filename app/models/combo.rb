class Combo < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  # validates :description, presence: true
  has_many :sponsored_combos, dependent: :destroy
  belongs_to :movie
  belongs_to :restaurant
  validates :movie, uniqueness: { scope: :restaurant }
  acts_as_votable
end
