class ProductsController < ApplicationController
  def index
    @products = Product.all
    # @categories = Category.all
    # @order_item = current_order.order_items.new
  end

  def category
    @products = Product.where(category_id: params[:catid])
    # @categories = Category.all
    @category = Category.find(params[:catid])
    # @order_item = current_order.order_items.new
  end

  def item
    @product = Product.find(params[:id])
  end

  def search_product
    category_selected = params[:category_selected]

    # @order_item = current_order.order_items.new
    @products = Product.where("lower(description) LIKE lower('%#{params[:product_keyword]}%') OR lower(name) LIKE lower('%#{params[:product_keyword]}%') ").order(:description)

    @products = @products.where(category_id: category_selected.to_i)  unless category_selected=='ALL'
  end

  # think about this....
  def search_category
    # @order_item = current_order.order_items.new
    @products = Product.where("lower(description) LIKE lower('%#{params[:product_keyword]}%') OR lower(name) LIKE lower('%#{params[:product_keyword]}%') ").order(:description)
  end

  def add_product_to_order
    # session[:product_id] = params[:id]
    # session[:product_qty] = params[:qty]
    puts 'ANDREA: setting flash notice'
    flash[:notice] = 'Action: add_product_to_order.'
    redirect_back(fallback_location: root_path)
  end

  def update_product_on_order
    flash[:notice] = 'Action: update_product_on_order.'
    redirect_back(fallback_location: root_path)
  end

  def remove_product_from_order
    flash[:notice] = 'Action: remove_product_from_order.'
    redirect_back(fallback_location: root_path)
  end

end
