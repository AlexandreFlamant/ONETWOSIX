class RemoveSponsorFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sponsor, :boolean, default: false
  end
end
