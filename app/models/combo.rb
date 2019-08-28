class Combo < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  belongs_to :movie
  belongs_to :restaurant
  acts_as_votable
end
