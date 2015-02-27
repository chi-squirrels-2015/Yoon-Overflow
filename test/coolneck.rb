# require 'rails_helper'
require 'capybara/rspec'

feature "User profile" do

  scenario "User has an email" do
    visit '/users/1' 
    expect(page).to have_content (/\S+@.+\S.+/)
  end

  # scenario "User has links" do
  #   visit '/users/1'
  #   expect(page).to have_content
  # end
end