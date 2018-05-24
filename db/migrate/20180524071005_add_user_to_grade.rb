class AddUserToGrade < ActiveRecord::Migration[5.2]
  def change
    change_table :grades do |t|
      t.integer :user_id
    end
  end
end
