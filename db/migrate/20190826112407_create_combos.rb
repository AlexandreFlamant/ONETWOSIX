class CreateCombos < ActiveRecord::Migration[5.2]
  def change
    create_table :combos do |t|
      t.string :name
      t.text :description
      t.references :movie, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
