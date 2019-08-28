class DropComboSelections < ActiveRecord::Migration[5.2]
  def change
    drop_table :combo_selections
  end
end
