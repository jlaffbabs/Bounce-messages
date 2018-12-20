ENV['RACK_ENV'] ||= 'test'

require File.join(File.dirname(__FILE__), "..", "app.rb")
require 'capybara'
require 'features/web_helpers'
require 'rspec'
require 'capybara/rspec'


Capybara.app = Bounce
