module ApplicationHelper
  def companies
    current_user.companies.order(:name)
  end

  def categories
    Category.joins(:jobs).where("jobs.user_id = ?", current_user.id)
  end

  def cities
    current_user.jobs.order(:city).distinct.pluck(:city)
  end
end