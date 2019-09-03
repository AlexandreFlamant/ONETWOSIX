class SponsoredCombo < ApplicationRecord
  belongs_to :combo, optional: true
  belongs_to :user
  validates :combo, uniqueness: true
  validates :user, presence: true
  # validates :active_status, presence: true
  monetize :price_cents
end
