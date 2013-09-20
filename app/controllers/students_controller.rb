  class StudentsController < ApplicationController
  skip_before_filter :login_required, :except => [:index]

  #all people can see this page, signup!
  def new
  end

  #Students create their self with the right passcode
  def create
    @survey = Survey.find_by_id(params[:student][:survey_id])
    if @survey && @survey.authenticate(params[:password])
      if !open?(@survey)
        redirect_to new_student_path, :alert => "This survey is closed!" 
        return
      end
      survey_id = params[:student][:survey_id]
      #Modifiy Username to make it reasonably unique
      username = params[:student][:username].prepend(survey_id)
      @student = Student.find_or_create_by_username_and_survey_id(username, survey_id)
      # @student = Student.create(params[:student])
      redirect_to new_student_response_path(@student) and return
    else
      redirect_to :back, :alert => "Please enter a valid passcode and class id."
    end
    
  end

  #Consider deleting show and index
  def show
    @student = Student.find_by_id(params[:id])
    #@survey = @student.survey
    #@factor_scores = @survey.find_student_factor_scores(@student)
  end

  #show this for the teacher only
  def index
  end

  private

  def open?(survey)
    true if survey.students.count < survey.size
  end
end
