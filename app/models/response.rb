class Response < ActiveRecord::Base
  attr_accessible :choice_id, :student_id

  belongs_to :student
  belongs_to :choice

  #there might be a method with takes choice_id inputs
  #and returns responses 

  #but might this need a particular survey_id? 
  #methinks so. 

  #for now, press on.
end
