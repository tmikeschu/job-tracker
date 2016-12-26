module ApplicationHelper
  def companies
    Company.order(:name)
  end

  def categories
    Category.joins(:jobs).where("jobs.user_id = ?", current_user.id)
  end

  def cities
    byebug
    current_user.jobs.order(:city).distinct.pluck(:city)
  end
end