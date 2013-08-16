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
    if @survey.students.present?
      @avg_class_scores = @survey.find_class_avg_scores_for_view
      @meta_important_scores = @survey.find_class_meta_selections_for_view(:import)
      @meta_improvement_scores = @survey.find_class_meta_selections_for_view(:improve)
      @meta_performing_scores = @survey.find_class_meta_selections_for_view(:perform)
    end
  end
end
