require "test_helper"

class DollarCourseControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get root_path
    assert_response :success
  end
end
