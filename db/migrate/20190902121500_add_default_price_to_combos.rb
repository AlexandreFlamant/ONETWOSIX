class AddDefaultPriceToCombos < ActiveRecord::Migration[5.2]
  def change
    remove_column :combos, :price_cents
    add_column :combos, :price_cents, :integer, default: 10_000
  end
end
