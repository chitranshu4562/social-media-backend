require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get user_signup" do
    get api_v1_users_user_signup_url
    assert_response :success
  end
end
