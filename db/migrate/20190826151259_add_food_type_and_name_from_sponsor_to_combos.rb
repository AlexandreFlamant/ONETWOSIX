class AddFoodTypeAndNameFromSponsorToCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :combos, :name_from_sponsor, :string
    add_column :combos, :food_type, :string
  end
end
