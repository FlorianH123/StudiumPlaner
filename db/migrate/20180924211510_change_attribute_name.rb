class ChangeAttributeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :time_tables, :name, :caption
  end
end
