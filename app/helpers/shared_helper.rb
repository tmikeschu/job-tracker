module SharedHelper
  def error_formatter(error)
    if error.include?("already been taken")
      error.insert(0, "That ").capitalize
    else
      error
    end
  end
end