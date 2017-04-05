require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get customer_login_url
    assert_response :success
  end

  test "should get register" do
    get customer_register_url
    assert_response :success
  end

  test "should get show" do
    get customer_show_url
    assert_response :success
  end

  test "should get edit" do
    get customer_edit_url
    assert_response :success
  end

  test "should get deactivate" do
    get customer_deactivate_url
    assert_response :success
  end

end
