module ApplicationHelper
  def companies
    Company.all
  end

  def categories
    Category.all
  end

  def cities
    Job.order(:city).distinct.pluck(:city)
  end
end