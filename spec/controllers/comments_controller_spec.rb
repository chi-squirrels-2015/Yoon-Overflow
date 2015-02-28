require 'rails_helper'

describe CommentsController do
  let!(:user)     { User.create( name: "fake", email: "fake@fake.org", password: "password" ) }
  let!(:question) { Question.create( title: "Test Question", content: "This is a question",
                                     user: user ) }
  let!(:answer)   { Answer.create( content: "This is an Answer", user: user, question: question ) }
  let!(:comment)  { Comment.new( content: "This is a Comment", commentable_type: "Question",
                                    commentable_id: question.id ) }

  context "Commenting on a Question" do
    describe "GET #new" do
      it 'creates a new comment' do
        get :new, question_id: 1
        expect(assigns(:comment)).to be_instance_of Comment
      end

      it 'does not save a new comment' do
        get :new, question_id: 1
        expect(assigns(:comment).id).to be_nil
      end
    end

    describe "POST #create" do
      context 'when invalid params are given' do
        it "assigns a newly created but unsaved comment as @comment" do
          session[:user_id] = user.id
          allow(comment).to receive(:current_user).with(:user)
          post :create, question_id: 1, comment: { content: "" }
          expect(assigns(:comment).id).to be_nil
        end

        it "re-renders the current form" do
          session[:user_id] = user.id
          allow(comment).to receive(:current_user).with(:user)
        end
      end

      context 'when valid params are given' do
        it 'creates a new Comment' do
          session[:user_id] = user.id
          allow(comment).to receive(:current_user).with(:user)

          expect{ post :create, question_id: 1, comment: comment_test_params }.to change{ Comment.count }.by(1)
        end
      end
    end
  end

  context "Commenting on an Answer" do
    describe "GET #new" do
      it 'creates a new comment' do
        get :new, question_id: 1, answer_id: 1
        expect(assigns(:comment)).to be_instance_of Comment
      end

      it 'does not save a new comment' do
        get :new, question_id: 1, answer_id: 1
        expect(assigns(:comment).id).to be_nil
      end
    end

    describe "POST #create" do
      context 'when invalid params are given' do
        it "assigns a newly created but unsaved comment as @comment" do
          session[:user_id] = user.id
          allow(comment).to receive(:current_user).with(:user)
          post :create, question_id: 1, answer_id: 1, comment: { content: "" }
          expect(assigns(:comment).id).to be_nil
        end

        it "re-renders the current form" do
          session[:user_id] = user.id
          allow(comment).to receive(:current_user).with(:user)
        end
      end

      context 'when valid params are given' do
        it 'creates a new Comment' do
          session[:user_id] = user.id
          allow(comment).to receive(:current_user).with(:user)

          expect{ post :create, question_id: 1, answer_id: 1, comment: comment }.to change{ Comment.count }.by(1)
        end
      end
    end
  end
end
