require "test_helper"

class Api::V1::PlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get places_detail" do
    get api_v1_places_places_detail_url
    assert_response :success
  end
end
