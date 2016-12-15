DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include FactoryGirl::Syntax::Methods

  c.before(:all) do
    begin
      DatabaseCleaner.clean
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end
end