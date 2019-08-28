class RemoveFoodtypeFromCombos < ActiveRecord::Migration[5.2]
  def change
    remove_column :combos, :food_type, :string
  end
end
