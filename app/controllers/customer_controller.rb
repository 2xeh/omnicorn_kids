class CustomerController < ApplicationController
  def login
    # not sure what to do here
  end

  def register
    # need to write create statement?
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(param[:id])
  end

  def edit; end

  def deactivate; end
end
