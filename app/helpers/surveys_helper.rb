module SurveysHelper
  def survey_full_name(survey)
    "#{survey.subject} #{survey.semester}".titleize
  end
end
