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
    Product.find(session[:to_order_list]) unless session[:to_order_list].nil?
  end

  def subtotal_order_price
    subtotal_order = 0

    unless session[:to_order_list].nil?
      products_to_order.each do |product|
        product_index = session[:to_order_list].index(product.id)
        qty_to_order = session[:product_quantities][product_index]
        subtotal_order += (product.price * qty_to_order)
      end
    end

    subtotal_order
  end
end
