require "application_system_test_case"

class LogInTest < ApplicationSystemTestCase
  def create_user
    User.create!(
      email: 'matt@gmail.com',
      password: 'password'
    )
  end

  test 'log in and log out' do
    create_user

    visit root_url
    click_on 'Log in'
    within 'main' do
      fill_in 'Email', with: 'matt@gmail.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end
    assert_selector "h1", text: "Home#index"

    click_on 'Log out'
    assert_selector 'a', text: 'Log in'
  end

  test 'log in with invalid password' do
    create_user

    visit new_user_session_url
    within 'main' do
      fill_in 'Email', with: 'matt@gmail.com'
      click_on 'Log in'
    end
    assert_text 'Invalid Email or password.'

    within 'main' do
      fill_in 'Email', with: 'matt@gmail.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end
    assert_selector "h1", text: "Home#index"
  end
end
