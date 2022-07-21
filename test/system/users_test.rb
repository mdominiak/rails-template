require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "login and logout" do
    User.create!(
      email: 'matt@gmail.com',
      password: 'password'
    )

    visit root_url
    click_on 'Log in'
    fill_in 'Email', with: 'matt@gmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    assert_selector "h1", text: "Home#index"

    click_on 'Log out'
    assert_selector 'a', text: 'Log in'
  end

  test "sign up and login" do
    visit root_url
    click_on 'Sign up'
    fill_in 'Email', with: 'matt@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    assert_selector "h1", text: "Home#index"

    click_on 'Log out'
    click_on 'Log in'
    fill_in 'Email', with: 'matt@gmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    assert_selector "h1", text: "Home#index"
  end
end