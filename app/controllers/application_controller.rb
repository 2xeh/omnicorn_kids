class ApplicationController < ActionController::Base
  # Exactly as per RichOnRails
  protect_from_forgery with: :exception

  helper_method :current_order
  helper_method :all_products
  helper_method :all_categories

  def all_products
    Product.all
  end

  def all_categories
    Category.all
  end

  def current_order
    # if there is an order id set, and it exists
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      order = Order.new
      session[:order_id] = order
    end

  # rescue but consider that the order would not exist if we have to do this
  rescue ActiveRecord::RecordNotFound
    session[:order_id] = nil
    order = Order.new
    session[:order_id] = order
    # note: ensure is like the finally in a try/catch
    # ensure
  end
end
