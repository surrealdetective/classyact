module StudentsHelper

  def student_username (student, survey)
    @student.username.humanize[(survey.id.to_s.length)..-1]
  end
end
