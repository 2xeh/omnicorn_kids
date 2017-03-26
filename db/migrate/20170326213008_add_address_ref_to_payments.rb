class AddAddressRefToPayments < ActiveRecord::Migration[5.0]
  def change
    add_reference :payments, :address, foreign_key: true
  end
end
