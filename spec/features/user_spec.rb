require 'rails_helper'

feature "User experience" do
  before :each do
    User.create!(:email => 'user@example.com', :password => 'password')
  end

  context "User viewing their profile" do
    scenario "should be able to navigate to the profile from the index" do
      pending
    end
  end

  context "User logging in" do
    scenario "should log me in with proper credentials" do
      visit '/users/sign_in'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
      expect(page).to have_content 'Log in'  #to finish


    end

    scenario "should not log me in unless I have proper credentials" do
      visit '/users/sign_in'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'passwordfail'
      click_button 'Log in'
      expect(page).to have_content 'Log in' 
    end

    scenario "should update the top bar if I log in" do
      visit '/users/sign_in'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
      expect(page).to have_content 'Logout'  #to finish
    end
  end

  context "User logging out" do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end

    scenario "should bring me to the index page upon logging out" do
      click_link('Logout')
      expect(current_path).to eq(post_comments_path(post))
    end

    scenario "should update the top bar upon logging out" do
      pending
    end
  end
end
