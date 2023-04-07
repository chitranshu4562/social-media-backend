require "test_helper"

class Api::V1::PlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get places_details" do
    get api_v1_places_places_details_url
    assert_response :success
  end
end
