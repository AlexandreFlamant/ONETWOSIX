class AddPaymentToSponsoredCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :sponsored_combos, :payment, :jsonb
  end
end
