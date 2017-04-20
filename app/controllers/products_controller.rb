class ProductsController < ApplicationController
  # before_action :initialize_session
  # helper_method :products_to_order
  # helper_method :subtotal_order_price

  def cart; end

  def category
    @products = Product.where(category_id: params[:catid])
    # @categories = Category.all
    @category = Category.find(params[:catid])
    # @order_item = current_order.order_items.new
  end

  def checkout
    @provinces = Province.all
  end

  def index
    @products = Product.all
    # @categories = Category.all
    # @order_item = current_order.order_items.new
  end

  def item
    @product = Product.find(params[:id])
  end


  def charges
    # WE NEED TO PERSIST THE ORDER HERE!!!!

    # need to receive the params from checkout
    # create an order and all the order items
    # record customer info

    amount = 500 # $5 in cents

    @customer = Stripe::Customer.create(email:  params[:stripeEmail],
                                       source: params[:stripeToken])

    @charge = Stripe::Charge.create(customer:    @customer.id,
                                    amount:      amount,
                                    description: 'Rails Stripe customer',
                                    currency:    'cad')
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  # query to search by product
  def search_product
    category_selected = params[:category_selected]

    # @order_item = current_order.order_items.new
    @products = Product.where("lower(description) LIKE lower('%#{params[:product_keyword]}%') OR lower(name) LIKE lower('%#{params[:product_keyword]}%') ").order(:description)

    @products = @products.where(category_id: category_selected.to_i) unless category_selected == 'ALL'
  end

  # AA note: I'm pretty sure I don't need this
  # # query to search by category
  # def search_category
  #   # @order_item = current_order.order_items.new
  #   @products = Product.where("lower(description) LIKE lower('%#{params[:product_keyword]}%') OR lower(name) LIKE lower('%#{params[:product_keyword]}%') ").order(:description)
  # end

  # using parallel sessions, track product_id and corresponding qtys
  def add_product_to_order
    prod_id = params[:id].to_i
    qty_to_order = params[:qty].to_i

    add_or_update_product_qty(prod_id, qty_to_order)

    flash[:notice] = 'Product added to cart'
    redirect_back(fallback_location: root_path)
  end

  # Assumption: the product is in session. We just need to add to it.
  def update_product_on_order
    prod_id = params[:id].to_i
    qty_to_order = params[:qty].to_i

    add_or_update_product_qty(prod_id, qty_to_order)

    flash[:notice] = 'Updated qty in cart'
    redirect_back(fallback_location: cart_path)
  end

  def remove_product_from_order
    prod_id = params[:id].to_i

    # we have the product id. If it is in session, remove it and qty
    if session[:to_order_list].include?(prod_id)
      # get the index. We need this number for updating qty
      product_index = session[:to_order_list].index(prod_id)
      session[:to_order_list].delete(prod_id)
      session[:product_quantities].delete_at(product_index)
    end

    # puts "ANDREA: to_order_list session #{session[:to_order_list]}"
    # puts "ANDREA: product_quantities session #{session[:product_quantities]}"
    flash[:notice] = 'Removed product from cart.'
    redirect_back(fallback_location: cart_path)
  end

  private

  def add_or_update_product_qty(prod_id, qty_to_order)
    session[:to_order_list] << prod_id unless session[:to_order_list]
                                              .include?(prod_id)
    # get the id so we can add qty to parallel session array
    product_index = session[:to_order_list].index(prod_id)
    session[:product_quantities][product_index] = qty_to_order
    # puts "ANDREA: to_order_list session #{session[:to_order_list]}"
    # puts "ANDREA: product_quantities session #{session[:product_quantities]}"
  end

  # def initialize_session
  #   session[:to_order_list] ||= []
  #   session[:product_quantities] ||= []
  # end
  #
  # def products_to_order
  #   Product.find(session[:to_order_list])
  # end
  #
  # def subtotal_order_price
  #   subtotal_order = 0
  #
  #   products_to_order.each do |product|
  #     product_index = session[:to_order_list].index(product.id)
  #     qty_to_order = session[:product_quantities][product_index]
  #     subtotal_order += (product.price * qty_to_order)
  #   end
  #
  #   subtotal_order
  # end
end
