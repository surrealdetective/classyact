class SurveysController < ApplicationController

  def index
    
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])
    @survey.populate_questions

    @survey.save
    redirect_to @survey
  end

  def show
    @survey = Survey.find_by_id(params[:id])
  end
end
