class AddDefaultPriceToSponsoredCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :sponsored_combos, :price_cents, :integer, default: 10_000
  end
end
