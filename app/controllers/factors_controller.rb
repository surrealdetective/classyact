class FactorsController < ApplicationController

  def factor
    @survey         = Survey.find_by_id(params[:survey_id])
    @factor         = params[:factor].to_sym
    @sub_avg_factor = @survey.find_class_sub_scores_for_view(@factor)
    @import         = @survey.find_class_meta_sub_scores_for_view(@factor, :import)
    @perform        = @survey.find_class_meta_sub_scores_for_view(@factor, :perform)
    @improve        = @survey.find_class_meta_sub_scores_for_view(@factor, :improve)
    render 'factor'
  end

end