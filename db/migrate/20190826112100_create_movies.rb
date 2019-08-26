class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.text :description
      t.string :photo_url

      t.timestamps
    end
  end
end
