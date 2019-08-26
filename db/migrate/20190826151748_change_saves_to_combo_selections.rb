class ChangeSavesToComboSelections < ActiveRecord::Migration[5.2]
  def change
    rename_table :saves, :combo_selections
  end
end
