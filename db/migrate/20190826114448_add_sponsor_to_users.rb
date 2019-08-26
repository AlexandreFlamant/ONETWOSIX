class AddSponsorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sponsor, :boolean, default: false
  end
end
