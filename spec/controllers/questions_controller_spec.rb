require 'rails_helper'

describe QuestionsController do
  let!(:user)     { User.create!(name:"Fake Fakerson", email:"Fake@Fake.net", password:"fakeFAKE",
                                 bio:"I'm fake", avatar_url:"fake.com/fake.png")}
  let!(:question) { Question.create!(title: "Fake Question", content: "This is a fake question", user: user) }

  describe "GET #index" do
    it "assigns all questions as @questions" do
      get :index
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  describe "GET #show" do
    it "assign the requested question as @question" do
      get :show, { id: question.to_param }
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "GET #new" do
    it "should create a new question" do
      get :new
      expect(assigns(:question).id).to be_nil
    end

    it "should not save the question to the database" do
      previous_count = Question.all.length
      get :new
      expect(Question.all.length).to eq(previous_count)
    end
  end

  # describe "GET #edit" do
  #   it "" do

  #   end
  # end

  # describe "POST create" do
  # end

  describe "DELETE #destroy" do
    it "assigns the requested question as @question" do
      delete :destroy, { id: question.to_param }
      expect(assigns(:question)).to eq(question)
    end

    it "destroys the requested question" do
      expect {
        delete :destroy, id: question.id
      }.to change(question, :count).by(-1)
    end

    it "redirects to the questions list" do
        delete :destroy, { id: question.to_param }
        expect(response).to be_redirect
    end
  end

end
