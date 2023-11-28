require "test_helper"

class SportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sports_index_url
    assert_response :success
  end
end
