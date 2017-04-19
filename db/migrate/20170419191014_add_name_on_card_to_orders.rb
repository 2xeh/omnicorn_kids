class AddNameOnCardToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :name_on_card, :string
  end
end
