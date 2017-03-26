class AddPaymentRefToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :payment, foreign_key: true
  end
end
