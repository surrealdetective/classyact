class ResponsesController < ApplicationController
  #show this for every student
  def new
    @student = Student.find_by_id(params[:student_id])
    @survey = @student.survey
    @questions = @survey.questions.limit(11).offset(params[:offset])
    # @response = Response.new
    # raise params.inspect
  end

  #this should lead to student show page
  def create
    @student = Student.find_by_id(params[:student_id])
    @survey = @student.survey
    
    #you have to pass in the correct questions...
    #@questions.each do |question|
    @survey.questions.each do |question|
      @student.responses.build(:choice_id => params[question.id.to_s], :survey_id => @survey.id, :question_id => question.id)
    end

    @student.save
    if @student.responses.count < 69
      redirect_to new_student_response_path(:offset => params[:offset])
    else
      redirect_to survey_student_path(@student.survey, @student)
    end
  end

end
