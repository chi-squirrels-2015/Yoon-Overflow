require 'rails_helper'

describe AnswersController do
  let!(:user) { User.create!(name: 'Fake Name', email: 'fake@fake.com', password: 'password') }
  let!(:question) { Question.create!(title: 'Fake Title', content: 'fake content', user: user) }
  let!(:answer) { Answer.create!(content: 'Fake Content', question: question, user: user) }

  describe "GET #new" do
    it 'creates a new question' do
      get :new, question_id: 1
      expect(assigns(:answer).id).to be_nil
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new Answer" do
        post :create, { answer: {id: answer.to_param}, question_id: 1 }
        expect(assigns(:answer)).to_not be_nil
      end

      it "assigns a newly created answer as @answer" do
        post :create, { answer: {id: answer.to_param}, question_id: 1 }
        expect(assigns(:answer)).to be_kind_of(Answer)
      end

      it "redirects to the answer on question page" do
        post :create, { answer: {id: answer.to_param}, question_id: 1 }
        expect(response.status).to eq(302)
      end
    end
  end


end



