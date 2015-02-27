require 'rails_helper'
require 'capybara/rspec'

feature "User profile" do

  scenario "User has an email" do
    visit '/users/1' 
    expect(page).to have_content (/\S+@.+\S.+/)
  end
end
