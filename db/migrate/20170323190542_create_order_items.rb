class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.decimal :price
      t.integer :qty
      t.string :size

      t.timestamps
    end
  end
end
