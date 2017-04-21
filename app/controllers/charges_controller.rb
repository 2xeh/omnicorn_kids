class ChargesController < ApplicationController
  def new
    # def place_order
    @name_on_card = params[:name_on_card]
    @email = params[:email]
    @street_address = params[:street_address]
    @city = params[:city]
    @postal_code = params[:postal_code]
    @province = Province.find(params[:province_selected])
    @description = "Omnicorn Kids purchase for #{@name_on_card}, #{@email}"

    # ok, let's be careful with rounding here in the calculation
    subtotal = params[:subtotal]
    @subtotal_cents = (subtotal.to_f * 100).to_i.to_f
    @pst_cents = (@subtotal_cents.to_i * @province.pst).to_i.to_f
    @gst_cents = (@subtotal_cents.to_i * @province.gst).to_i.to_f
    @hst_cents = (@subtotal_cents.to_i * @province.hst).to_i.to_f
    @total_cents = @subtotal_cents + @pst_cents + @gst_cents + @hst_cents
    session[:total_cents] = @total_cents

    # create a new order and store it's id in session
    new_order = Order.create(name_on_card: @name_on_card,
                             street_address: @street_address,
                             city: @city, postal_code: @postal_code,
                             pst: @province.pst, gst: @province.gst,
                             hst: @province.hst,
                             subtotal: (@subtotal_cents / 100),
                             order_status_id: 1)
    new_order.save
    session[:order_id] = new_order.id
  end

  def create
    # ok, need to complete the checkout process
    # get values out of session and params
    @amount = session[:total_cents].to_i

    new_order = Order.find(session[:order_id])
    new_payment = Payment.create(order_id: new_order.id,
                                 email: params[:stripeEmail],
                                 amount: @amount)

    new_payment.save

    # add the payment id to the order
    new_order.payment_id = new_payment.id
    new_order.save

    # Now let's create order items for all products ordered
    session[:to_order_list].each_with_index do |product, i|
      ref_product = Product.find(product)
      qty_ordered = session[:product_quantities][i]
      new_order_item = OrderItem.create(product_id: product,
                                        price: ref_product.price,
                                        qty: qty_ordered)
      new_order_item.save
    end

    @customer = Stripe::Customer.create(email:  params[:stripeEmail],
                                        source: params[:stripeToken])

    @charge = Stripe::Charge.create(customer:    @customer.id,
                                    amount:      @amount,
                                    description: 'Rails Stripe customer',
                                    currency:    'cad')

    @ref_email = params[:stripeEmail]
    # And clear the session because we are done
    reset_session
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
