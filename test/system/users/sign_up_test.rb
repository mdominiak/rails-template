require "application_system_test_case"

class SignUpTest < ApplicationSystemTestCase
  test "sign up and login" do
    visit root_url
    click_on 'Sign up'
    within 'main' do
      fill_in 'Email', with: 'matt@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign up'
    end
    assert_selector "h1", text: "Home#index"

    click_on 'Log out'
    click_on 'Log in'
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

    within 'main' do
      fill_in 'Email', with: 'matt@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign up'
    end
    assert_selector "h1", text: "Home#index"
  end
end
