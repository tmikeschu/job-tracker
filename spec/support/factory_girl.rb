DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include FactoryGirl::Syntax::Methods

  c.before(:all) do
    DatabaseCleaner.clean
    FactoryGirl.lint
  end

  c.before(:each) do
    Rails.application.load_seed
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end
end