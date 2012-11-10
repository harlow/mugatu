ENV['RAILS_ENV'] = 'test'

require 'rspec'
require 'mugatu'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
