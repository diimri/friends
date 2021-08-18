require "test_helper"

class FavControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get fav_update_url
    assert_response :success
  end
end
