class RemoveNameFromSponsorFromCombos < ActiveRecord::Migration[5.2]
  def change
    remove_column :combos, :name_from_sponsor, :string
  end
end
