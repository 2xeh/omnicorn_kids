class ApplicationController < ActionController::Base
  # Exactly as per RichOnRails
  protect_from_forgery with: :exception

  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      order = Order.new
      order.order_status_id = 1
    end
  end
end
