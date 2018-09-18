class DropTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :events_participants
  end
end
