class RemovePriceFromCombos < ActiveRecord::Migration[5.2]
  def change
    remove_column :combos, :price_cents
  end
end
