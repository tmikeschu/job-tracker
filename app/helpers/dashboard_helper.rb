module DashboardHelper
  def top_three_companies_by_interest_level
    interest_count = current_user.jobs.group("company_id").order("avg(jobs.level_of_interest)").reverse_order.limit(3).average(:level_of_interest)
    output = interest_count.reduce({}) do |result, company|
      result[Company.find(company.first).name] = company.last.to_i
      result
    end
  end

  def city_jobs_count
    current_user.jobs.group(:city).count
  end

  def jobs
    current_user.jobs
  end

  def interest_level_and_jobs
    current_user.jobs.group(:level_of_interest).order("level_of_interest DESC").count
  end

  def interest_ranges
    %w(0-9 10-19 20-29 30-39 40-49 50-59 60-69 70-79 80-89 90-99 100+)
  end

  def jobs_in_range
    interest_ranges.map do |range|
      if range.include?("-")
        range = range.partition("-")
        current_user.jobs.where(level_of_interest: [range.first.to_i..range.last.to_i]).count
      else
        current_user.jobs.where("level_of_interest >= ?", 100).count
      end
    end
  end

  def city_jobs_count
    current_user.jobs.group(:city).order("count_id DESC").count("id")
  end
end
