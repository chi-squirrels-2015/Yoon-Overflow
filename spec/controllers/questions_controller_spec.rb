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

  describe "GET #edit" do
    it "should assign the requested question as @question" do
      get :edit, { id: question.to_param }
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "POST create" do
    context "when valid params are passed" do
      it "creates a new Question" do
        post :create, { question: {id: question.to_param} }
        expect(assigns(:question)).to_not be_nil
      end

      it "assigns a newly created question as @question" do
        post :create, { question: {id: question.to_param} }
        expect(assigns(:question)).to be_kind_of(Question)
      end

      it "redirects to the created question" do
        post :create, { question: {id: question.to_param} }
        expect(response.status).to eq(200)
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved question as @question [for title]" do
        expect{ post :create, question: { title: ""} }.not_to change{ Question.all.count }
      end

      it "assigns a newly created but unsaved question as @question [for content]" do
        expect{ post :create, question: { content: ""} }.not_to change{ Question.all.count }
      end

      it "re-renders the 'new' template" do
        post :create, question: { title: "" }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    context "when valid params are passed" do
      it "changes the requested fields" do
        put :update, { id: question.to_param, question: { title: "This is a new title" } }
        expect(assigns(:question).title).to eq("This is a new title")
      end
    end

    context "when invalid params are passed" do
      it "redirects back to the edit page" do
        put :update, { id: question.to_param, question: { title: "" } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested question as @question" do
      delete :destroy, { id: question.to_param }
      expect(assigns(:question)).to eq(question)
    end

    it "destroys the requested question" do
      expect {
        delete :destroy, id: question.id
      }.to change(Question.all, :count).by(-1)
    end

    it "redirects to the questions list" do
        delete :destroy, { id: question.to_param }
        expect(response).to be_redirect
    end
  end

end
