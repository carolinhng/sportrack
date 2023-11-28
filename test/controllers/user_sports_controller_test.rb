require "test_helper"

class UserSportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_sports_index_url
    assert_response :success
  end

  test "should get new" do
    get user_sports_new_url
    assert_response :success
  end

  test "should get show" do
    get user_sports_show_url
    assert_response :success
  end
end
