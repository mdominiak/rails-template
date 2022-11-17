require "application_system_test_case"

class SignUpTest < ApplicationSystemTestCase
  test 'sign up and log in' do
    visit root_url
    click_on 'Sign up'
    within 'main' do
      fill_in 'Email', with: 'matt@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign up'
    end
    assert_text 'A message with a confirmation link has been sent to your email address.'

    # confirm email address by following the confirmation link in the email
    visit url_from_email
    assert_text 'Your email address has been successfully confirmed.'

    # log in
    within 'main' do
      fill_in 'Email', with: 'matt@gmail.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end
    assert_selector "h1", text: "Home#index"
  end

  test 'sign up with invalid email' do
    visit new_user_registration_url
    within 'main' do
      click_on 'Sign up'
    end
    assert_text "Email can't be blank"

    # sign up with valid email
    within 'main' do
      fill_in 'Email', with: 'matt@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign up'
    end
    assert_text 'A message with a confirmation link has been sent to your email address.'
  end
end
