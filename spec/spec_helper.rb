require 'capybara/rspec'

Capybara.app_host = 'https://learn.livemocha.com/'
Capybara.run_server = false
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {})
end
