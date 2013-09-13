class Response < ActiveRecord::Base
  attr_accessible :choice_id, :student_id, :question_id, :survey_id

  belongs_to :student
  belongs_to :choice
  belongs_to :survey
  belongs_to :question

  validates :choice_id, :presence => true

  #there might be a method with takes choice_id inputs
  #and returns responses 

  #but might this need a particular survey_id? 
  #methinks so. 

  #for now, press on.

  def self.find_student_meta_selections(quiz)
    self.joins(:choices => :questions).includes(:surveys)
  end
end
