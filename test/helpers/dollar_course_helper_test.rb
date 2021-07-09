class DollarCourseHelperTest < ActionView::TestCase
  test "should be equal" do
    assert_equal '75,1952 ₽', parse_site('https://www.cbr.ru/', '.mono-num')
  end
end
