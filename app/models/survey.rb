class Survey < ActiveRecord::Base
  attr_accessible :semester, :subject, :user_id
end
