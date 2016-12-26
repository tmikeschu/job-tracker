require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence :first_name do
      Faker::Name.first_name
    end

    sequence :last_name do
      Faker::Name.last_name
    end

    sequence :email do |n|
      "#{n}#{Faker::Internet.email}"
    end

    sequence :password do
      Faker::Internet.password(10, 50)
    end

    factory :full_user do
      after(:create) do |user|
        user.jobs = create_list(:job_with_company, 10)
      end
    end
  end
  
  factory :contact do
    sequence :first_name do
      Faker::Name.first_name
    end

    sequence :last_name do 
      Faker::Name.last_name
    end

    sequence :position do
      Faker::Name.title
    end

    sequence :email do
      Faker::Internet.email
    end
  end

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
        job.category = create(:category)
        job.company = create(:company_with_contacts)
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

    factory :company_with_contacts do
      after(:create) do |company|
        company.contacts = create_list(:contact, 10)
      end
    end

    factory :company_with_jobs_and_contacts do
      after(:create) do |company|
        company.jobs = create_list(:job_with_category, 10)
        company.contacts = create_list(:contact, 10)
      end
    end
  end
end