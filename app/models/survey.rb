class Survey < ActiveRecord::Base
  attr_accessible :semester, :subject, :user_id

  belongs_to :user
  has_many :students
  has_many :questions

  def populate_questions
    thinking_1 = self.questions.build_with_agree_choices(:content => "I can read well, write well, do math well, and interact with others well.")
  end
end
