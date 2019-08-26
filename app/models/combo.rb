class Combo < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  belongs_to :movie
  belongs_to :restaurant
end
