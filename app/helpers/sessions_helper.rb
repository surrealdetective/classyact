module SessionsHelper
  def about_info factor
    case factor
    when "thinking"
      "You arrived at thinking"
    when "willing"
      "You arrived at willing"
    when "interactions"
    when "discipline"
    when "direction"
    when "expectations"
    end
  end
end
