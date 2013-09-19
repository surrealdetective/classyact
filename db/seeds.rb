year = (2012..2023).collect{|x| x}

3.times do
  teacher = User.new
  teacher.password = 'password123'
  teacher.email = Faker::Internet.email
  
  s = teacher.surveys.new
  s.subject = "Rails"
  s.semester = "Summer " + year.shift.to_s
  s.populate_questions
  s.password = "flatiron"
  s.size = 25
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