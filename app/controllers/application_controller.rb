class ApplicationController < ActionController::Base
  # Exactly as per RichOnRails
  protect_from_forgery with: :exception

  helper_method :current_order

  def current_order
    # if there is an order id set, and it exists
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      order = Order.new
    end
  # rescue but consider that the order would not exist if we have to do this
  rescue ActiveRecord::RecordNotFound
    session[:order_id] = nil
  #ensure
    order = Order.new
  end
end
