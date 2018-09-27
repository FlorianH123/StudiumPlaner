require 'test_helper'

class TimeTableTest < ActiveSupport::TestCase
  test "should not save time table without caption" do
    @user = users(:exampleUser)
    @time_table = TimeTable.new(user_id: @user.id)
    assert_not @time_table.save
  end

  test "should save time table" do
    @user = users(:exampleUser)
    @time_table = TimeTable.new(caption: "Test", user_id: @user.id)
    assert @time_table.save
  end
end
