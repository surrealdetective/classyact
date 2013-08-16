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
    # @avg_class_scores = @survey.find_class_avg_scores
    @avg_class_scores = @survey.find_class_avg_scores_for_view
    # @thinking, @expectations, @interactions = @avg_class_scores[:thinking], @avg_class_scores[:expectations], @avg_class_scores[:interactions]
    # @discipline, @willing, @direction = @avg_class_scores[:discipline], @avg_class_scores[:willing], @avg_class_scores[:direction] 
    @meta_important_scores = @survey.find_class_meta_selections_for_view(:import)
    # @thinking, @expectations, @interactions = @avg_class_scores[:thinking], @avg_class_scores[:expectations], @avg_class_scores[:interactions]
    # @discipline, @willing, @direction = @avg_class_scores[:discipline], @avg_class_scores[:willing], @avg_class_scores[:direction] 
  end
end
