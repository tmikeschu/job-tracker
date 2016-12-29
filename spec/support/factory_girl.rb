DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include FactoryGirl::Syntax::Methods
  Rails.application.load_seed
end