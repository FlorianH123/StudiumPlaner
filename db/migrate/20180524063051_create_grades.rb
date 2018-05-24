class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.float :grade
      t.string :lecture

      t.timestamps
    end
  end
end
