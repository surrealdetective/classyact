class StudentsController < ApplicationController
  
  #all people can see this page, signup!
  def new
  end

  #people who sign up can access this
  def create
  end

  #only shown after you take the survey.
  def show
    @student = Student.find_by_id(params[:id])
    @survey = @student.survey
    @score_totals = @survey.student_score(@student)
    @factor_scores = @survey.student_factor_scores(@score_totals)
  end

  #show this for the teacher only
  def index
  end
end
