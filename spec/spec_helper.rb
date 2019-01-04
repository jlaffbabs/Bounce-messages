ENV['RACK_ENV'] ||= 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'features/web_helpers'
require 'rspec'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

Capybara.app = Bounce

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |test|
    DatabaseCleaner.cleaning do
      test.run
    end
  end

end
