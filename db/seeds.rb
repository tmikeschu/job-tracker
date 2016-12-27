require 'factory_girl_rails'

Company.destroy_all
Job.destroy_all
Category.destroy_all
Contact.destroy_all
User.destroy_all

FactoryGirl.create(:full_user, email: "sample@sample.sample", password: "password123")