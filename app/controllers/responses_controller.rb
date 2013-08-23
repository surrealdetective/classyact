class ResponsesController < ApplicationController
  skip_before_filter :login_required

  def new
    @student = Student.find_by_id(params[:student_id])
    @survey = @student.survey
    @questions = @survey.questions.limit(11).offset(@student.responses.count)
  end

  #this should lead to student show page
  def create
    @student = Student.find_by_id(params[:student_id])
    @survey = @student.survey
    offset = @student.responses.count
    @survey.questions[offset..(offset+10)].each do |question|
      @student.responses.build(:choice_id => params[question.id.to_s], :survey_id => @survey.id, :question_id => question.id)
    end

    @student.save
    if @student.responses.count < 69
      redirect_to new_student_response_path(:offset => params[:offset])
    else
      redirect_to survey_student_path(@student.survey, @student)
    end
  end


  # before_filter :survey_pswd_required

  # def survey_pswd_required
  #   redirect_to login_path, :notice => "You must be a student of this class!" unless passcoded_in?
  # end

  # def current_student #finds the current user, but we don't need a session, we just... or maybe we do
  #   @current_user ||= Student.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user # makes this method accessible in the views

  # def login(user)
  #   session[:user_id] = user.id
  #   @current_user = user
  # end



  # def passcoded_in?
  #   !!current_user
  # end

end
