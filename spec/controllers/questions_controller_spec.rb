require 'rails_helper'

describe QuestionsController do
  let!(:user)     { User.create!(name:"Fake Fakerson", email:"Fake@Fake.net", password:"fake",
                                 bio:"I'm fake", avatar_url:"fake.com/fake.png")}
  let!(:question) { Question.create!(title: "Fake Question", content: "This is a fake question",
                                     user: user) }

  describe "GET #index" do
  end

  describe "GET #show" do
  end

  describe "GET #new" do
  end

  describe "POST create" do
  end

  describe "DELETE #destroy" do
  end

end
