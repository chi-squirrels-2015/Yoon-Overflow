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


end



