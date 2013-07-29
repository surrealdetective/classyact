class Question < ActiveRecord::Base
  attr_accessible :content, :survey_id

  belongs_to :survey
  has_many :choices

  def build_with_agree_choices(q_content)
  end
end
