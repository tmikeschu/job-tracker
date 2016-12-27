module ApplicationHelper
  def companies
    current_user.companies.order(:name)
end

  def categories
    current_user.categories.order(:title)
  end

  def all_cities
    current_user.jobs.order(:city).distinct.pluck(:city)
  end
end