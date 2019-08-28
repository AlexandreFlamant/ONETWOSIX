class AddRestaurantToCombos < ActiveRecord::Migration[5.2]
  def change
    add_reference :combos, :restaurant, foreign_key: true
  end
end
