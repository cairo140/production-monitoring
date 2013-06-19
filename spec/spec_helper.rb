require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {})
end
Capybara.default_driver = :poltergeist
# Capybara.default_driver = :webkit

RSpec.configure do |config|
  config.before(:each) do
    page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36" }
  end
end
