module ApplicationHelper
  def companies
    Company.all
  end

  def categories
    Category.all
  end
end