require 'factory_girl_rails'

FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "#{Faker::Company.name} #{n}"
    end

    factory :category_with_jobs do
      after(:create) do |category|
        jobs = create_list(:job_with_company, 10)
        category.jobs = jobs
      end
    end
  end

  factory :job do
    sequence :title do 
      Faker::Name.title
    end

    sequence :description do
      Faker::Lorem.sentence
    end

    sequence :level_of_interest do
      rand(99) + 1
    end

    sequence :city do
      Faker::Address.city
    end

    factory :job_with_category do
      after(:create) do |job|
        job.category = create(:category)
      end
    end

    factory :job_with_company do
      after(:create) do |job|
        job.company = create(:company)
      end
    end
  end

  factory :company do
    sequence :name do |n|
      "#{Faker::Company.name} #{n}"
    end

    factory :company_with_jobs do
      after(:create) do |company|
        company.jobs = create_list(:job_with_category, 10)
      end
    end
  end
end