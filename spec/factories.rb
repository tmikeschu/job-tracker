require 'factory_girl_rails'

FactoryGirl.define do

  factory :job do
    sequence :title do |n|
      "Job#{n * (rand(3)+1)}"
    end

  end

end