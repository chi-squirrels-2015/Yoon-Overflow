class VotesController < ApplicationController
  respond_to :html, :js

   def question_upvote
    @question = Question.friendly.find(params[:question_id])
    @user = current_user
    unless @question.votes.find_by(voter_id: @user.id )
    @question.votes << Vote.create(voter_id: @user.id)
    end

    render json: { votes: @question.votes.count, question: @question.id }
  end


  def question_downvote
    @question = Question.friendly.find(params[:question_id])
    @user = current_user
    if @question.votes.find_by(voter_id: @user.id )
     @question.votes.find_by(voter_id: @user.id ).destroy
    end

    render json: { votes: @question.votes.count, question: @question.id }
  end

  # def question_upvote
  #   @question = Question.find(params[:question_id])
  #   @user = current_user
  #   @question.upvote_by current_user
  #   redirect_to question_path(@question)
  # end

  # def question_downvote
  #   @question = Question.find(params[:question_id])
  #   @user = current_user
  #   @question.downvote_by current_user
  #   redirect_to question_path(@question)
  # end

  def answer_upvote
    @answer = Answer.find(params[:answer_id])
    @user = current_user
    unless @answer.votes.find_by(voter_id: @user.id )
      @answer.votes << Vote.create(voter_id: @user.id)
    end
    redirect_to :back
  end

  def answer_downvote
    @answer = Answer.find(params[:answer_id])
    @user = current_user
    if @answer.votes.find_by(voter_id: @user.id )
      @answer.votes.find_by(voter_id: @user.id ).destroy
    end
    redirect_to :back
  end
end
