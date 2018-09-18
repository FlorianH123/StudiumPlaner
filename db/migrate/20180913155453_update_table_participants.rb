class UpdateTableParticipants < ActiveRecord::Migration[5.2]
  def change
    rename_table :table_participants, :event_participants
  end
end
