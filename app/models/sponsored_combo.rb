class SponsoredCombo < ApplicationRecord
  belongs_to :combo, optional: true
  belongs_to :user
  validates :combo, uniqueness: true
  validates :user, presence: true
  # validates :active_status, presence: true
  monetize :price_cents

  def movie
    combo.movie
  end

  def restaurant
    combo.restaurant
  end

  def name
    combo.name
  end

  def description
    combo.description
  end
end
