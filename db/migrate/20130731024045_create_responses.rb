class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :choice_id
      t.integer :student_id

      t.timestamps
    end
  end
end
