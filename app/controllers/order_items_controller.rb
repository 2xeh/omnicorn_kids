class OrderItemsController < ApplicationController
  before_action :initialize_session
  # helper_method :products_to_order

  # almost exactly per RichOnRails - edited to match my models
  def create
    # current_order.order_status_id = 1
    @order = current_order
    puts "ANDREA: #{@order.inspect}"
    # consider putting in a query here to retrieve order_item if it exists?
    # look to application_controller for reference
    @order_item = order_item_to_use
    # @order_item = @order.order_items.new(order_item_params)
    @order.save
    # puts the current order id into session
    session[:order_id] = @order.id
    redirect_back(fallback_location: root_path)
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    # @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    remove_order_item
    redirect_back(fallback_location: root_path)
  end

  private

  def initialize_session
    session[:to_order_list] ||= []
  end

  def remove_order_item
    id = params[:product_id].to_i
    session[:to_order_list].delete(id)
    # flash[:notice] = "Removed product from cart."
    # redirect_back(fallback_location: root_path)
  end

  def order_item_to_use
    id_hash = order_item_params[:product_id]
    id = order_item_params[:product_id].to_i
    # puts "ANDREA: id_string: #{id_string}, id_qty: #{id_qty}, id_item: #{id_item}"
    puts "ANDREA: trying by hash: #{id_hash}"
    # puts "ANDREA: order_item_params: #{order_item_params.product_id}"

    if session[:to_order_list].include?(id)
      puts 'ANDREA: product is in session. get the order_item'
      @order.order_items.where(product_id: id)
    else
      puts 'ANDREA: product is NOT in session. create a new order_item'
      @order.order_items.new(order_item_params)
      session[:to_order_list] << id
    end
    # flash[:notice] = "Added product to cart."
    # redirect_back(fallback_location: root_path)
  end

  def order_item_params
    # in early versions of rails, we could access params directly
    # when building forms in rails 4
    params.require(:order_item).permit(:qty, :product_id)
  end
end
