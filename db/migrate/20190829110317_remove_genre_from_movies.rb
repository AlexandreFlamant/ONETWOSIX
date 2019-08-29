class RemoveGenreFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :genre, :string
    add_reference :movies, :genre, foreign_key: true
  end
end
