class Order < ApplicationRecord
  validates :address, presence: true, uniqueness: true
  belongs_to :combo
  belongs_to :user
end
