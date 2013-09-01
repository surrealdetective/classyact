class Question < ActiveRecord::Base
  attr_accessible :content, :survey_id

  belongs_to :survey
  has_many :choices

  def build_agree_choices
    self.choices.build(:content => "Strongly Agree", :value => 5)
    self.choices.build(:content => "Agree", :value => 4)
    self.choices.build(:content => "Neither Agree nor Disagree", :value => 3)
    self.choices.build(:content => "Disagree", :value => 2)
    self.choices.build(:content => "Strongly Disagree", :value => 1)
  end

  def build_frequency_choices
    self.choices.build(:content => "Always", :value => 5)
    self.choices.build(:content => "Very Often", :value => 4)
    self.choices.build(:content => "Sometimes", :value => 3)
    self.choices.build(:content => "Rarely", :value => 2)
    self.choices.build(:content => "Never", :value => 1)
  end

  def build_meta_choices
    self.choices.build(:content => "One",   :value => 1)
    self.choices.build(:content => "Two",   :value => 2)
    self.choices.build(:content => "Three", :value => 3)
    self.choices.build(:content => "Four",  :value => 4)
    self.choices.build(:content => "Five",  :value => 5)
    self.choices.build(:content => "Six",   :value => 6)
    self.choices.build(:content => "Seven", :value => 7)
    self.choices.build(:content => "Eight", :value => 8)
  end

  #There should be a choice for each factor, and three questions.
  def build_overview_choices
    self.choices.build(:content => "Thinking Factor", :value => 1)
    self.choices.build(:content => "Self-expectations Factor", :value => 1)
    self.choices.build(:content => "Interactions Factor", :value => 1)
    self.choices.build(:content => "Self-discipline Factor", :value => 1)
    self.choices.build(:content => "Willing Factor", :value => 1)
    self.choices.build(:content => "Self-direction Factor", :value => 1)
  end
end
