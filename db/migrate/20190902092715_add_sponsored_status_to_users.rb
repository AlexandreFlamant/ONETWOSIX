class AddSponsoredStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sponsor_status, :boolean, default: false
  end
end
