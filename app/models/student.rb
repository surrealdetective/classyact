class Student < ActiveRecord::Base
  attr_accessible :survey_id, :username

  belongs_to :survey
end
