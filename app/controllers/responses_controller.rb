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
    @student = Student.find_by_id(params[:student_id])
    @student.survey.questions.each do |question|
      @student.responses.build(:choice_id => params[question.id.to_s])
    end
    @student.save
  end
end
