class ResponsesController < ApplicationController
  #show this for every student
  def new
    @student = Student.find_by_id(params[:student_id])
    @survey = @student.survey
    @response = Response.new
    # raise params.inspect
  end

  #this should lead to student show page
  def create
    raise params.inspect
    @student = Student.find_by_id(params[:student_id])
    @survey = @student.survey
    @survey.questions.each do |question|
      @student.responses.build(:choice_id => params[question.id.to_s], :survey_id => @survey.id, :question_id => question.id)
    end
    @student.save
    redirect_to survey_student_path(@student.survey, @student)
  end

end
