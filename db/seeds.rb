# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create the survey
#change the controller to find or create the first survey
#give the survey a unique identifier, so it never fails.

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


#students respond to the survey


#later, set up methods that re-use questions and their answers.
#however, surveys differ bc they have different owners, subjects, and etc.