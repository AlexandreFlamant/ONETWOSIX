class CreateFoodTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :food_types do |t|
      t.string :name
      t.string :photo_url

      t.timestamps
    end
  end
end
