class AddLinkUrlToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :link_url, :string
  end
end
