class StudentsController < ApplicationController
  skip_before_filter :login_required, :except => [:index]

  #all people can see this page, signup!
  def new
  end

  #Students create their self with the right passcode
  def create
    @survey = Survey.find_by_id(params[:student][:survey_id])
    if @survey && @survey.authenticate(params[:password])
      @student = Student.create(params[:student])
      redirect_to new_student_response_path(@student)
    else
      redirect_to :back, :alert => "Please enter a valid passcode and class id."
    end
    
  end

  #Consider deleting show and index
  def show
    @student = Student.find_by_id(params[:id])
    @survey = @student.survey
    @factor_scores = @survey.find_student_factor_scores(@student)
  end

  #show this for the teacher only
  def index
  end
end
