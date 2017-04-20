class ApplicationController < ActionController::Base
  # helper_method :current_order # RichOnRails
  before_action :initialize_session
  helper_method :all_products
  helper_method :all_categories
  helper_method :products_to_order
  helper_method :subtotal_order_price

  def all_products
    Product.all
  end

  def all_categories
    Category.all
  end

  def initialize_session
    session[:to_order_list] ||= []
    session[:product_quantities] ||= []
  end

  private

  def products_to_order
    if session[:to_order_list] != nil
      Product.find(session[:to_order_list])
    end
  end

  def subtotal_order_price
    subtotal_order = 0

    if session[:to_order_list] != nil
      products_to_order.each do |product|
        product_index = session[:to_order_list].index(product.id)
        qty_to_order = session[:product_quantities][product_index]
        subtotal_order += (product.price * qty_to_order)
      end
    end
    
    subtotal_order
  end

  # AA note: originally based on RichOnRails
  # def current_order
  #   # if there is an order id set, and it exists
  #   if !session[:order_id].nil?
  #     order = Order.find(session[:order_id])
  #     puts "ANDREA: application_controller #{order.inspect}"
  #
  #     return order
  #   else
  #     order = Order.new
  #     session[:order_id] = order.id
  #     puts "ANDREA: application_controller #{order.inspect}"
  #   end
  #
  # # rescue but consider that the order would not exist if we have to do this
  # rescue ActiveRecord::RecordNotFound
  #   session[:order_id] = nil
  #   order = Order.new
  #   # order.save
  #   session[:order_id] = order.id
  #   puts "ANDREA: application_controller rescue of current_order: #{order.inspect}"
  #   return order
  #   # note: ensure is like the finally in a try/catch
  #   # ensure
  # end
end
