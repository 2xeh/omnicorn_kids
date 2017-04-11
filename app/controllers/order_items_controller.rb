class OrderItemsController < ApplicationController
  # almost exactly per RichOnRails - edited to match my models
  def create
    # current_order.order_status_id = 1
    @order = current_order
    # consider putting in a query here to retrieve order_item if it exists?
    # look to application_controller for reference
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    # puts the current order id into session
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:qty, :product_id)
  end
end
