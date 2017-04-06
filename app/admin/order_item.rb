ActiveAdmin.register OrderItem do
  permit_params :price, :qty, :total_price, :order_id, :product_id
end
