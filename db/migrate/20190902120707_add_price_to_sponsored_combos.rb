class AddPriceToSponsoredCombos < ActiveRecord::Migration[5.2]
  def change
    add_monetize :combos, :price, currency: { present: false }
  end
end
