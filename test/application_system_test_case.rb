require "test_helper"
require "selenium/webdriver"

Capybara.register_driver :selenium_chrome_in_container do |app|
  Capybara::Selenium::Driver.new app,
                                 browser: :remote,
                                 capabilities: Selenium::WebDriver::Remote::Capabilities.chrome,
                                 url: "http://selenium_chrome:4444/wd/hub"
end

Capybara.server_host = "0.0.0.0"
Capybara.server_port = 4000
Capybara.app_host = 'http://web:4000'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  driven_by :selenium_chrome_in_container

  def log_in(user)
    visit new_user_session_url
    within 'main' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
    end
    assert_selector "h1", text: "Home#index"
  end

  def url_from_email
    ActionMailer::Base.deliveries.last.body.match(/href="(.*)"/)[1]
  end
end
