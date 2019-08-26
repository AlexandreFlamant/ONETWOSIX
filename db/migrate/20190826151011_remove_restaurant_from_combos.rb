class RemoveRestaurantFromCombos < ActiveRecord::Migration[5.2]
  def change
    remove_reference :combos, :restaurant, foreign_key: true
  end
end
