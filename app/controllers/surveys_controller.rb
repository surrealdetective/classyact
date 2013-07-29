class SurveysController < ApplicationController

  def index
    
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])
    @survey.populate_questions
  end
end
