class SurveysController < ApplicationController

  def new
    @user = params[:user_id]
    @survey = Survey.new
    authorize! :create, @survey
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @survey = @user.surveys.build(params[:survey])
    authorize! :create, @survey
    @survey.populate_questions

    @survey.save
    redirect_to user_survey_path(@user, @survey)
  end

  def show
    @user = params[:user_id]
    @survey = Survey.find_by_id(params[:id])
    authorize! :read, @survey
    @factors = @survey.factors
    if @survey && @survey.students.present?
      @avg_class_scores = @survey.find_class_avg_scores_for_view
      @meta_important_scores = @survey.find_class_meta_selections_for_view(:import)
      @meta_improvement_scores = @survey.find_class_meta_selections_for_view(:improve)
      @meta_performing_scores = @survey.find_class_meta_selections_for_view(:perform)
    end
  end
end
