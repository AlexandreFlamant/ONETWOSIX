class Combo < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :food_type, presence: true
  validates :description, presence: true, uniqueness: true
  belongs_to :movie
  has_many :combo_selectons, dependent: :destroy
end
