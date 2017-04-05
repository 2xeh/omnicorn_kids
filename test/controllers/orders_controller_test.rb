require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get add_item" do
    get orders_add_item_url
    assert_response :success
  end

  test "should get cart" do
    get orders_cart_url
    assert_response :success
  end

  test "should get checkout" do
    get orders_checkout_url
    assert_response :success
  end

  test "should get history" do
    get orders_history_url
    assert_response :success
  end

  test "should get summary" do
    get orders_summary_url
    assert_response :success
  end

end
