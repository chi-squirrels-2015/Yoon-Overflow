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
      pending
    end

    scenario "should not log me in unless I have proper credentials" do
      pending
    end

    scenario "should update the top bar if I log in" do
      pending
    end
  end

  context "User logging out" do
    before :each do
      #log in
      pending
    end

    scenario "should bring me to the index page upon logging out" do
      pending
    end

    scenario "should update the top bar upon logging out" do
      pending
    end
  end
end
