ENV['RAILS_ENV'] = 'test'

require 'rspec'
require 'active_record'
require 'database_cleaner'
require 'mugatu'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end