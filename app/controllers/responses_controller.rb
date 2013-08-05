class ResponsesController < ApplicationController
  #show this for every student
  def new
    @student = Student.find_by_id(params[:id])
  end

  #this should lead to student show page
  def create
    @student = Student.find_by_id(params[:id])
    @student.add_responses(params[:responses])
  end
end
