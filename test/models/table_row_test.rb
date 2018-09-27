require 'test_helper'

class TableRowTest < ActiveSupport::TestCase
  test "should not save table row without period string" do
    @time_table = time_tables(:timeTableExample)
    @table_row = TableRow.new(monday_field: "Test", time_table_id: @time_table.id)
    assert_not @table_row.save
  end

  test "should save table row" do
    @time_table = time_tables(:timeTableExample)
    @table_row = TableRow.new(period: "1. Stunde 8.15 - 9.45", monday_field: "Test", time_table_id: @time_table.id)
    assert @table_row.save
  end
end
