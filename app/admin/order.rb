ActiveAdmin.register Order do
  permit_params :pst, :gst, :hst, :customer_id, :subtotal,
                :address_id, :customer_id, :payment_id, :order_status_id
end
