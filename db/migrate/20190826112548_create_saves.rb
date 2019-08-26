class CreateSaves < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|
      t.references :user, foreign_key: true
      t.references :combo, foreign_key: true

      t.timestamps
    end
  end
end
