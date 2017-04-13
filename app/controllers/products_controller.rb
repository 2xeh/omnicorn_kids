class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @order_item = current_order.order_items.new
  end

  def category
    @products = Product.where(category_id: params[:catid])
    @categories = Category.all
    @category = Category.find(params[:catid])
    @order_item = current_order.order_items.new
  end

  def item
    @product = Product.find(params[:id])
  end

  def search_keyword
    keyword = params[:keyword].downcase
    @prod_result = Product\
                   .where("lower(description) LIKE '%#{keyword}%'")
                   .order(:description)
  end
end
