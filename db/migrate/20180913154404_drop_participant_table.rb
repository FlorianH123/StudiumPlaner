class DropParticipantTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :event_participants
  end
end