class Choice < ActiveRecord::Base
  attr_accessible :content, :value, :question_id

  belongs_to :question
end
