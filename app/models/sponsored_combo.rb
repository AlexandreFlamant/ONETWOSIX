class SponsoredCombo < ApplicationRecord
  belongs_to :combo
  belongs_to :user
  # validates :combo, presence: true
  validates :user, presence: true
  # validates :active_status, presence: true
  monetize :price_cents
end
