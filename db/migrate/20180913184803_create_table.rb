class CreateTable < ActiveRecord::Migration[5.2]
  def change
    create_table :participants_events, id: false do |t|
      t.belongs_to :events
      t.belongs_to :users
    end
  end
end
