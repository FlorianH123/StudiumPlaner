require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should not save event without place" do
    @event = Event.new(title: "Test", date_from: DateTime.current + 10, date_to: DateTime.current + 20)
    assert_not @event.save
  end

  test "should not save event without title" do
    @event = Event.new(place: "Test", date_from: DateTime.current + 10, date_to: DateTime.current + 20)
    assert_not @event.save
  end

  test "should not save event without date from" do
    @event = Event.new(title: "Test", place: "Test", date_to: DateTime.current + 20)
    assert_not @event.save
  end

  test "should not save event without date_to" do
    @event = Event.new(title: "Test", place: "Test", date_from: DateTime.current + 10)
    assert_not @event.save
  end

  test "should not save event when date_to is before date_from" do
    @event = Event.new(title: "Test", place: "Test", date_from: DateTime.current + 20, date_to: DateTime.current + 10)
    assert_not @event.save
  end

  test "should not save event when date_from is before current date" do
    @event = Event.new(title: "Test", place: "Test", date_from: DateTime.current - 30, date_to: DateTime.current + 10)
    assert_not @event.save
  end

  test "should not save event when date_to is before current date" do
    @event = Event.new(title: "Test", place: "Test", date_from: DateTime.current - 30, date_to: DateTime.current - 20)
    assert_not @event.save
  end

  test "should save event" do
    @event = Event.new(title: "Test", place: "Test", date_from: DateTime.current + 10, date_to: DateTime.current + 20)
    assert @event.save
  end
end
