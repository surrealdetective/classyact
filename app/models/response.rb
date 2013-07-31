class Response < ActiveRecord::Base
  attr_accessible :choice_id, :student_id

  belongs_to :student
  belongs_to :choice #maybe denormalize this later
end
