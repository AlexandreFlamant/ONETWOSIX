class Combo < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :food_type, presence: true
  validates :description, presence: true
  belongs_to :movie
  has_many :combo_selections, dependent: :destroy
  acts_as_votable
end
