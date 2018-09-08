class AddUserToEvent < ActiveRecord::Migration[5.2]
  def change
    change_table :events do |t|
      t.integer :user_id
    end
  end
end
