require "test_helper"

class StimulusControllerTest < ActionDispatch::IntegrationTest
  test "should get addExercice" do
    get stimulus_addExercice_url
    assert_response :success
  end
end
