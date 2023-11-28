require "test_helper"

class SeancesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get seances_edit_url
    assert_response :success
  end
end
