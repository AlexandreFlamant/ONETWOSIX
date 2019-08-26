class AddRestaurantAndStatusToComboSelections < ActiveRecord::Migration[5.2]
  def change
    add_column :combo_selections, :status, :string
    add_reference :combo_selections, :restaurant, foreign_key: true
  end
end
