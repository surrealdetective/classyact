class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.integer :survey_id

      t.timestamps
    end
  end
end
