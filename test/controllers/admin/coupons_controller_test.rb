require "test_helper"

class Admin::CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_coupons_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_coupons_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_coupons_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_coupons_new_url
    assert_response :success
  end
end
