require "test_helper"

class TrainingExercicesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get training_exercices_new_url
    assert_response :success
  end
end
