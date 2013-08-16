#Create sample data for seeds
year = (2012..2023).collect{|x| x}

#Seed 10 teachers with 25 students each
10.times do
  #Make a teacher
  teacher = User.new
  teacher.username = Faker::Name.first_name
  teacher.email = Faker::Internet.email
  #Make a survey
  s = teacher.surveys.new
  s.subject = "Rails"
  s.semester = "Summer " + year.shift.to_s
  s.populate_questions
  teacher.save
  #Make students with questions
  25.times do 
    student = s.students.create(:username => Faker::Name.first_name)
    s.questions.each do |question|
      response = student.responses.build(:choice_id => question.choices.sample.id, :survey_id => s.id, :question_id => question.id)
      response.save
    end
  end
  teacher.save
end

#later, set up methods that re-use questions and their answers.
#however, surveys differ bc they have different owners, subjects, and etc.