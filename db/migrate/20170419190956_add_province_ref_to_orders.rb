class AddProvinceRefToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :orders, foreign_key: true
  end
end
