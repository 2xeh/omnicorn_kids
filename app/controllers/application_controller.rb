class ApplicationController < ActionController::Base
  # helper_method :current_order # RichOnRails
  helper_method :all_products
  helper_method :all_categories

  def all_products
    Product.all
  end

  def all_categories
    Category.all
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
