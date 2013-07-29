class Survey < ActiveRecord::Base
  attr_accessible :semester, :subject, :user_id

  belongs_to :user
  has_many :students
  has_many :questions
end
