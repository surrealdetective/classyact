class FactorsController < ApplicationController

  def thinking
    @survey         = Survey.find_by_id(params[:survey_id])
    @sub_avg_factor = @survey.find_class_sub_scores_for_view(:thinking)
    @import         = @survey.find_class_meta_sub_scores_for_view(:thinking, :import)
    @perform        = @survey.find_class_meta_sub_scores_for_view(:thinking, :perform)
    @improve        = @survey.find_class_meta_sub_scores_for_view(:thinking, :improve)
  end

  def interactions
    @survey         = Survey.find_by_id(params[:survey_id])
    @sub_avg_factor = @survey.find_class_sub_scores_for_view(:interactions)
    @import         = @survey.find_class_meta_sub_scores_for_view(:interactions, :import)
    @perform        = @survey.find_class_meta_sub_scores_for_view(:interactions, :perform)
    @improve        = @survey.find_class_meta_sub_scores_for_view(:interactions, :improve)
  end

  def willing
    @survey = Survey.find_by_id(:survey_id)
  end

  def expectations
    @survey = Survey.find_by_id(:survey_id)
  end

  def discipline
    @survey = Survey.find_by_id(:survey_id)
  end

  def direction
    @survey = Survey.find_by_id(:survey_id)
  end
end
