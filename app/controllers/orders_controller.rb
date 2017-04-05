class OrdersController < ApplicationController
  def add_item
    @item = OrderItem.new
  end

  def cart

  end

  def checkout
    
  end

  def history
    @orders = Order.where(customer_id: param[:cust_id])
  end

  def summary
    @order = Order.find(param[:order_id])
  end
end
