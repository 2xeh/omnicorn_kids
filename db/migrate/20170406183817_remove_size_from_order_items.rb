class RemoveSizeFromOrderItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_items, :size, :string
  end
end
