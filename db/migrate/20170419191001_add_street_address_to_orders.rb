class AddStreetAddressToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :street_address, :string
  end
end
