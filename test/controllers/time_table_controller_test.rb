require 'test_helper'

class TimeTableControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get time_table_show_url
    assert_response :success
  end

end
