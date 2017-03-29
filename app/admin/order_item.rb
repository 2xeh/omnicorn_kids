ActiveAdmin.register OrderItem do
  permit_params :price, :qty, :size, :order_id, :product_id
end
