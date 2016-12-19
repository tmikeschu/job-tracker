module ApplicationHelper
  def companies
    Company.order(:name)
  end

  def categories
    Category.order(:title)
  end

  def cities
    Job.order(:city).distinct.pluck(:city)
  end
end