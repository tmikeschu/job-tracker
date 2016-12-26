require 'factory_girl_rails'

Company.destroy_all
Job.destroy_all
Category.destroy_all
Contact.destroy_all
User.destroy_all

# COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
# JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
# CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
# CATEGORIES = ["Web Development", "DevOps", "Startup", "Backend", "Full Stack"]

5.times do 
  FactoryGirl.create(:full_user)
end

# CATEGORIES.each do |title|
#   Category.create(title: title)
# end

# 20.times do
#   Contact.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, position: Faker::Name.title, email: Faker::Internet.email)
# end

# i = 0
# COMPANIES.each do |name|
#   company = Company.create!(name: name)
#   company.contacts = Contact.offset(i).limit(2)
#   i += 2
#   company.save
#   puts "Created #{company.name}"
#   10.times do |num|
#     company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category_id: (rand(CATEGORIES.count) + 1))
#     puts "  Created #{company.jobs[num].title}"
#   end
# end
