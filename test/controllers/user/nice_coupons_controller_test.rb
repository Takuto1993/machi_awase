require "test_helper"

class User::NiceCouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_nice_coupons_index_url
    assert_response :success
  end
end
