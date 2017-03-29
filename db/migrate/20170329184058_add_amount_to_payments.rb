class AddAmountToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :amount, :decimal
  end
end
