module ApplicationHelper
  def companies
    Company.order(:name)
  end

  def categories
    ids = current_user.jobs.pluck(:category_id)
    ids.map { |id| Category.find(id) }.sort_by { |category| category.title }
  end

  def cities
    byebug
    current_user.jobs.order(:city).distinct.pluck(:city)
  end
end