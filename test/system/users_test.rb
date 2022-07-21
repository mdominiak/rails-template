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

  test 'login with invalid password' do
    User.create!(
      email: 'matt@gmail.com',
      password: 'password'
    )

    visit new_user_session_url
    fill_in 'Email', with: 'matt@gmail.com'
    click_on 'Log in'
    assert_text 'Invalid Email or password.'

    fill_in 'Email', with: 'matt@gmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    assert_selector "h1", text: "Home#index"
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

  test 'sign up without email' do
    visit new_user_registration_url
    click_on 'Sign up'
    assert_text "Email can't be blank"

    fill_in 'Email', with: 'matt@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    assert_selector "h1", text: "Home#index"
  end
end
