require "test_helper"

class DollarCourseControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dollar_course_show_url
    assert_response :success
  end
end
