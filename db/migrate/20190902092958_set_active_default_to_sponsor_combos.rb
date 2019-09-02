class SetActiveDefaultToSponsorCombos < ActiveRecord::Migration[5.2]
  def change
    change_column :sponsored_combos, :active_status, :boolean, default: false
  end
end
