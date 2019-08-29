class RemoveFoodTypeFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :food_type, :string
    add_reference :restaurants, :food_type, foreign_key: true
  end
end
