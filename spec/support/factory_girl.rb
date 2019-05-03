DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include FactoryBot::Syntax::Methods

  c.before(:all) do
    begin
      DatabaseCleaner.clean
      FactoryBot.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end
end
