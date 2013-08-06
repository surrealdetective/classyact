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
    #use the choices[] syntax?
    @student.add_responses(params[:responses])
  end
end
