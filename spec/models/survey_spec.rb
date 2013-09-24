require 'spec_helper'

describe Survey do
  #Uses shoulda rails 3 convention, which differs from expect().to
  it { should validate_presence_of(:size) }
  it { should belong_to(:user) }

  let (:user)    { User.create(:email => "test@test.com", :password => "testest") }
  let (:survey)  { user.surveys.create(:size => 35, :subject => "test", :semester => "fall 2013", :password => 'testtest') }
  let (:student) { survey.students.create(:username => 'test') }

  describe "#populate_questions" do 

    it "generates 69 questions by default" do
      survey.populate_questions
      survey.save
      expect(survey.questions.count).to eq 69 
    end

    it "creates (factors * 11) + 3 questions based on factors surveyed" do
      pending "extra feature for later"
    end
  end

  describe "#student_score" do
    it "scores the responses of the student" do
      survey.questions.each do |question|
        response = student.responses.build(:choice_id => question.choices.sample.id, :survey_id => survey.id, :question_id => question.id)
        response.save
      end
      expect(survey.student_score(student)).to eq 5
    end
    
  end

end