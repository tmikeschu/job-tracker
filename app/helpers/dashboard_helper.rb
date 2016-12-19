module DashboardHelper
  def top_three_companies_by_interest_level
    interest_count = Company.joins(:jobs).group("companies.id").order("avg(jobs.level_of_interest)").reverse_order.limit(3).average(:level_of_interest)
    output = interest_count.reduce({}) do |result, company|
      result[Company.find(company.first).name] = company.last.to_i
      result
    end
  end

  def city_jobs_count
    Job.group(:city).count
  end

end
