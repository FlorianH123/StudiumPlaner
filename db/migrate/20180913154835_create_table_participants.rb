class CreateTableParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :table_participants do |t|
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
