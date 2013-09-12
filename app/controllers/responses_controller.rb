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
    question_count = @survey.questions.count
    offset = @student.responses.count
    @survey.questions[offset..(offset+10)].each do |question|
      @student.responses.build(:choice_id => params[question.id.to_s], :survey_id => @survey.id, :question_id => question.id)
    end

    @student.save
    if @student.responses.count < question_count
      redirect_to new_student_response_path(:offset => params[:offset])
    else
      redirect_to survey_student_path(@student.survey, @student)
    end
  end
end
