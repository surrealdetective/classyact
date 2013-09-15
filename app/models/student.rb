class Student < ActiveRecord::Base
  attr_accessible :survey_id, :username

  validates :username, :uniqueness => true

  belongs_to :survey
  has_many :responses

  def add_responses(choices)
    self.responses.build()
  end
end
