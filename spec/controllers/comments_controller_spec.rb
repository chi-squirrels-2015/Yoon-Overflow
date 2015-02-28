require 'rails_helper'

describe CommentsController do
  let!(:user)     { User.create( name: "fake", email: "fake@fake.org", password: "password" ) }
  let!(:question) { Question.create( title: "Test Question", content: "This is a question",
                                     user: user ) }
  let!(:answer)   { Answer.create( content: "This is an Answer", user: user, question: question ) }
  let!(:commentQ)  { Comment.create( content: "This is a Comment", commentable_type: "Question",
                                     commentable_id: question.id ) }
  let!(:commentA)  { Comment.create( content: "This is a Comment", commentable_type: "Answer",
                                     commentable_id: answer.id ) }

  context "Commenting on a Question" do
    describe "GET #new" do
      it 'creates a new comment' do
        get :new, question_id: 1
        expect(assigns(:commentQ)).to be_instance_of Comment
      end

      it 'does not save a new comment' do
        get :new, question_id: 1
        expect(assigns(:commentQ).id).to be_nil
      end
    end

    describe "POST #create" do
      context 'when invalid params are given' do
      end

      context 'when valid params are given' do
      end
    end
  end

  context "Commenting on an Answer" do
    describe "GET #new" do
      it 'creates a new comment' do
        get :new, answer_id: 1
        expect(assigns(:commentQ)).to be_instance_of Comment
      end

      it 'does not save a new comment' do
        get :new, answer_id: 1
        expect(assigns(:commentQ).id).to be_nil
      end
    end

    describe "POST #create" do
      context 'when invalid params are given' do
      end

      context 'when valid params are given' do
      end
    end
  end
end
