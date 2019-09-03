class AddStateToSponsoredCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :sponsored_combos, :state, :string
  end
end
