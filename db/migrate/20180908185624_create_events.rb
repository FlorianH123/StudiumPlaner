class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.timestamp :date_from
      t.timestamp :date_to
      t.string :place
      t.string :title
      t.timestamps
    end
  end
end
