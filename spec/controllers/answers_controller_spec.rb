require 'rails_helper'

describe AnswersController do
  let!(:user) { User.create!(name: 'Fake Name', email: 'fake@fake.com', password: 'password') }
  let!(:question) { Question.create!(title: 'Fake Title', content: 'Fake question', user: user) }
  let!(:answer) { Answer.create!(content: 'Fake answer', question: question, user: user) }

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
        expect(response.status).to eq(200)
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved game as @answer" do
        expect{ post :create, { answer: { id: "apple" }, question_id: 1 } }.not_to change{ Answer.all.count }
      end

      it "re-renders the 'new' template" do
        post :create, answer: { id: "apple" }, question_id: 1
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested answer as @answer" do
      get :edit, id: answer.to_param, question_id: 1
      expect(assigns(:answer)).to eq(answer)
    end
  end

  describe "PUT #update" do
    context "when valid params are passed" do
      it "assigns the requested answer as @answer" do
      put :update, { id: answer.to_param, answer: {content: "New fake answer"}, question_id: 1 }
      expect(assigns(:answer)).to eq(answer)
    end

      it "updates the answer" do
        put :update, { id: answer.to_param, answer: {content: "New fake answer"}, question_id: 1 }
        expect(assigns(:answer).content).to eq("New fake answer")
      end
    end

  end

  describe "DELETE #destroy" do
    it "assigns the requested answer as @answer" do
      delete :destroy, id: answer.to_param, question_id: 1
      expect(assigns(:answer)).to eq(answer)
    end

    it "destroys the requested answer" do
      expect {
        delete :destroy, id: answer.to_param, question_id: 1
      }.to change(Answer, :count).by(-1)
    end

    it "redirects to the question" do
        delete :destroy, id: answer.to_param, question_id: 1
        expect(response).to be_redirect
    end
  end

end



