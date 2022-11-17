require "application_system_test_case"

class ResetPasswordTest < ApplicationSystemTestCase
  test 'reset password' do
    user = User.create!(email: 'matt@mgmail.com', password: 'forgotten_password', confirmed_at: 1.minute.ago)

    # request password reset
    visit new_user_session_url
    click_on 'Forgot password?'
    fill_in 'Email', with: user.email
    click_on 'Send me reset password instructions'
    assert_text 'You will receive an email with instructions on how to reset your password in a few minutes.'

    # reset password
    reset_password_url = url_from_email
    visit reset_password_url
    fill_in 'New password', with: 'new_password'
    fill_in 'Confirm new password', with: 'new_password'
    click_on 'Change my password'
    assert_text 'Your password has been changed successfully. You are now signed in.'
  end
end
