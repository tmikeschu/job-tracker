require 'factory_girl_rails'

FactoryGirl.define do
  factory :category do
    title "MyString"
  end

  factory :job do
    sequence :title do 
      Faker::Name.title
    end

    sequence :description do
      Faker::Lorem.sentence
    end

    sequence :level_of_interest do |n|
      rand(99) + 1
    end

    sequence :city do
      Faker::Address.city
    end
  end

  factory :company do
    sequence :name do |n|
      Faker::Company.name
    end

    factory :company_with_jobs do
      after(:create) do |company|
        company.jobs = create_list(:job, 10)
      end
    end
  end

end