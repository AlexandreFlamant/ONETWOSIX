class CreateSponsoredCombos < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsored_combos do |t|
      t.references :combo, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :active_status

      t.timestamps
    end
  end
end
