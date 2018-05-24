class DbFix < ActiveRecord::Migration[5.2]
  def change
    rename_column :grades, :grade, :grade_value
  end
end
