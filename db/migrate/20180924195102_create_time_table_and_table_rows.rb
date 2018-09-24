class CreateTimeTableAndTableRows < ActiveRecord::Migration[5.2]
  def change
    create_table :time_tables do |t|
      t.string :name
      t.integer :user_id
    end

    create_table :table_rows do |t|
      t.references :time_table, index: true, foreign_key: {on_delete: :cascade}
      t.integer :order
      t.text :period
      t.text :monday_field
      t.text :tuesday_field
      t.text :wednesday_field
      t.text :thursday_field
      t.text :friday_field
      t.text :saturday_field
    end
  end
end

