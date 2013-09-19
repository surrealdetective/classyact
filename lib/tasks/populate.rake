namespace :db do
  desc "custom populate"
  task :populate, [:email] => :environment do |t, args|
    require "Faker"

    teacher           = User.new
    email             = args[:email]
    name              = email.split('@').first
    teacher.password  = name
    teacher.email     = email
      
    s = teacher.surveys.new
    s.subject = name.capitalize
    s.semester = "Fall 2013"
    s.populate_questions
    s.password = name
    s.size = 35
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
    new_teacher       = User.last
    puts "Last user #{new_teacher} has email address: #{new_teacher.email}."
    puts "The survey has #{s.students.count} students with survey size of #{s.size}"
    puts "Survey password is #{s.password}"
  end
end