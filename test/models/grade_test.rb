require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  test "should not save grade without grade value" do
    @user = users(:exampleUser)
    @grade = Grade.new(lecture: "Test", user_id: @user.id)
    assert_not @grade.save
  end

  test "should not save grade without lecture" do
    @user = users(:exampleUser)
    @grade = Grade.new(grade_value: 1.0, user_id: @user.id)
    assert_not @grade.save
  end

  test "should not save grade when grade value is not a number" do
    @user = users(:exampleUser)
    @grade = Grade.new(grade_value: "Test", lecture: "Test", user_id: @user.id)
    assert_not @grade.save
  end

  test "should not save grade when grade value is < 1.0" do
    @user = users(:exampleUser)
    @grade = Grade.new(grade_value: 0.9, lecture: "Test", user_id: @user.id)
    assert_not @grade.save
  end

  test "should not save grade when grade value is > 4.0" do
    @user = users(:exampleUser)
    @grade = Grade.new(grade_value: 4.1, lecture: "Test", user_id: @user.id)
    assert_not @grade.save
  end

  test "should save grade when grade value is = 4.0" do
    @user = users(:exampleUser)
    @grade = Grade.new(grade_value: 4.0, lecture: "Test", user_id: @user.id)
    assert @grade.save
  end

  test "should save grade when grade value is = 1.0" do
    @user = users(:exampleUser)
    @grade = Grade.new(grade_value: 1.0, lecture: "Test", user_id: @user.id)
    assert @grade.save
  end
end
