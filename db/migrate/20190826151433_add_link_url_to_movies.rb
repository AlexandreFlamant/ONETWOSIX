class AddLinkUrlToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :link_url, :string
  end
end
