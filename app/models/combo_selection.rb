class ComboSelection < ApplicationRecord
  belongs_to :user
  belongs_to :combo
  belongs_to :restaurant
end
