class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @order_item = current_order.order_items.new
  end

  def category
    @category_products = Product.where(category_id: params[:catid])
    @category = Category.find(params[:catid])
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
