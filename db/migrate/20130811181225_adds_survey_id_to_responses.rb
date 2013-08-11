class AddsSurveyIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :survey_id, :integer
    add_column :responses, :question_id, :integer
  end
end
