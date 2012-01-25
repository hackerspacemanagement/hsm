require 'spec_helper'

describe User do

    
  before do
      @role = Factory.create :role, :name => "User"
  end
    
  describe 'logging in' do

    before do
      @user = Factory.create(:user, :email => 'fry@planet-express.com', :password => 'password', :password_confirmation => 'password')
    end

    it 'should display a login link on the homepage' do
      visit root_url

      page.should have_css("a[href='#{ new_user_session_path }']")
    end

    it 'cannot log in until account is confirmed' do
      visit new_user_session_path
      fill_in_fields :user_email => @user.email, :user_password => 'password'

      click_button 'Sign in'

      page.should have_content('You have to confirm your account before continuing.')
    end

    it 'can log in once account has been confirmed' do
      visit user_confirmation_path(:confirmation_token => @user.confirmation_token)
      logout
      visit new_user_session_path
      fill_in_fields :user_email => @user.email, :user_password => 'password'

      click_button 'Sign in'
      page.should have_content(@user.email)
      page.should have_content('Logout')
    end

    it 'cannot log in as an existing user without the correct password' do
      visit user_confirmation_path(:confirmation_token => @user.confirmation_token)
      logout
      visit new_user_session_path
      fill_in_fields :user_email => @user.email, :user_password => 'not the password'

      click_button 'Sign in'

      page.should have_content('Invalid email or password.')
    end

    it 'redirects to the user dashboard on successful login' do
      visit user_confirmation_path(:confirmation_token => @user.confirmation_token)
      logout
      visit new_user_session_path
      fill_in_fields :user_email => @user.email, :user_password => 'password'

      click_button 'Sign in'

      page.should have_content(@user.email)
      page.should have_content('Logout')
    end

    it 'can log out if logged in' do
      login_as @user
      logout

      should_be_on root_path
      page.should have_content('Signed out successfully.')
    end

    it 'going to /logout while not logged in does not cause an error' do
      2.times { visit destroy_user_session_path }

      should_be_on root_path
      page.should have_no_content('Logged out successfully!')
    end

  end

  describe 'recovering password via email' do

    before do
      @user_a = Factory.create(:user, :email => 'zoidberg@planet-express.com',
                                      :reset_password_token   => 'H32rewifdsjfds',
                                      :reset_password_sent_at => Time.now)
      confirm_user @user_a
    end

    it 'should have a link to recover password' do
      visit new_user_session_path

      page.should have_css("a[href='#{ new_user_password_path }']")
    end

    it 'should send an email with a link to reset your password' do
      visit new_user_password_path

      fill_in_fields(:user_email => @user_a.email)
      clear_emails
      click_button('Send me reset password instructions')

      sent_emails.should have(1).email
      page.should have_content('You will receive an email with instructions about how to reset your password in a few minutes.')
    end

    it 'after following link in password reset email it should take you to a new page to reset your password' do
      visit edit_user_password_path(:reset_password_token => @user_a.reset_password_token)
      page.should have_content('Change your password')
      fill_in_fields(:user_password => 'new_password', :user_password_confirmation => 'new_password')
      click_button('Change my password')

      page.should have_content(@user_a.email)
      page.should have_content('Logout')
    end

  end

  describe 'resending confirmation instructions' do

    before do
      @confirmed_user   = Factory.create(:user, :email => 'confirmed@user.com')
      @unconfirmed_user = Factory.create(:user, :email => 'unconfirmed@user.com')

      confirm_user @confirmed_user
    end

    it 'should have a link to resend confirmation instructions' do
      visit new_user_session_path

      page.should have_content("Didn't receive confirmation instructions?")
    end

    it 'should send an email with a link to confirm your account if user is unconfirmed' do
      visit new_user_confirmation_path

      fill_in_fields(:user_email => @unconfirmed_user.email)
      clear_emails
      click_button('Resend confirmation instructions')

      sent_emails.should have(1).email
      page.should have_content('You will receive an email with instructions about how to confirm your account in a few minutes.')
    end

    it 'should not send an email with a link to confirm your account if user is already confirmed' do
      visit new_user_confirmation_path

      fill_in_fields(:user_email => @confirmed_user.email)
      clear_emails
      click_button('Resend confirmation instructions')

      sent_emails.should have(0).email
      page.should have_content('Email was already confirmed, please try signing in')
      page.should have_no_content('You will receive an email with instructions about how to confirm your account in a few minutes.')
    end

  end

end