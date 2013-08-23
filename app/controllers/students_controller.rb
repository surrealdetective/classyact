class StudentsController < ApplicationController
  skip_before_filter :login_required, :except => [:index]

  #all people can see this page, signup!
  def new
  end

  #people who sign up can access this
  def create
    @survey = Survey.find_by_id(params[:student][:survey_id])
    if @survey.authenticate(params[:password])
      @student = Student.create(params[:student])
      redirect_to new_student_response_path(@student)
    else
      redirect_to :back, :alert => "Please enter a valid passcode."
    end
    
  end

  #only shown after you take the survey.
  def show
    @student = Student.find_by_id(params[:id])
    @survey = @student.survey
    @factor_scores = @survey.find_student_factor_scores(@student)
  end

  #show this for the teacher only
  def index
  end
end
