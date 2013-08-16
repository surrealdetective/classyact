#create teachers, then crate their students
#spec: 10 teachers, 25 students

10.times do
  

end

#avi the teacher makes a survey
avi = User.new(:username => "avi", :email => "avi@avi.com")
s = avi.surveys.new(:subject => "Ruby on Rails", :semester => "Summer 2013")
s.populate_questions
avi.save

#students sign up for the survey
alex = s.students.build(:username => "alex")
max = s.students.build(:username => 'max')
sam = s.students.build(:username => 'sam')
joe = s.students.build(:username => 'joe')
s.save

s = avi.surveys.new(:subject => "Ruby on Rails", :semester => "Fall 2013")
s.populate_questions
avi.save

david = s.students.build(:username => "david")
daniel = s.students.build(:username => "daniel")
jennifer = s.students.build(:username => "jennifer")
alex = s.students.build(:username => "alex")
s.save

200.times do |i|
  user = User.new

  user.password = Populator.words(1)

  user.dossiers.build({
    :tagline            => Faker::Company.bs + Faker::Company.bs + Faker::Company.bs,
    :phone_number       => Faker::PhoneNumber.phone_number, #10.times.map{rand(9)}.insert(3, "-").insert(7, "-").join,
    :city               => city,
    :analytic_skills    => Populator.paragraphs(3),
    :tidbits            => Populator.paragraphs(3),
    :course             => courses.sample,
    :skype              => "#{Populator.words(1)}#{rand(999)}",
    :gender             => gender,
    :nyc                => nycs.sample
  })

  user.save
end

#students respond to the survey


#later, set up methods that re-use questions and their answers.
#however, surveys differ bc they have different owners, subjects, and etc.