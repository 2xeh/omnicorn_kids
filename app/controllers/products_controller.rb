class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def category
    @category_products = Product.where(category_id: params[:catid])
    @category = Category.find(params[:catid])
  end

  def item
    @product = Product.find(params[:id])
  end
end
