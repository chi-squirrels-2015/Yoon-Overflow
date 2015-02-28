class VotesController < ApplicationController


   def question_upvote
    @question = Question.friendly.find(params[:question_id])
    @user = current_user
    unless @question.votes.find_by(voter_id: @user.id )
    @question.votes << Vote.create(voter_id: @user.id)
    end
    redirect_to(root_path)
  end


  def question_downvote
    @question = Question.friendly.find(params[:question_id])
    @user = current_user
    if @question.votes.find_by(voter_id: @user.id )
     @question.votes.find_by(voter_id: @user.id ).destroy
    end
    redirect_to(root_path)

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
    @answer.upvote_by current_user
    redirect_to answer_path(@answer)
  end

  def downvote
    @answer = Answer.find(params[:answer_id])
    @user = current_user
    @answer.downvote_by current_user
    redirect_to answer_path(@answer)
  end
end
