class FactorsController < ApplicationController

  def factor
    @survey           = Survey.find_by_id(params[:survey_id])
    @factors          = @survey.factors
    @user             = @survey.user
    authorize! :read, @survey
    if @survey.students.any?
      @factor         = params[:factor].to_sym if params[:factor].include?(params[:factor])
      @sub_avg_factor = @survey.find_class_sub_scores_for_view(@factor)
      @import         = @survey.find_class_meta_sub_scores_for_view(@factor, :import)
      @perform        = @survey.find_class_meta_sub_scores_for_view(@factor, :perform)
      @improve        = @survey.find_class_meta_sub_scores_for_view(@factor, :improve)
      render 'factor'
    else
      redirect_to :back, :alert => "Wait till students take your survey to access this view."
    end
  end

end