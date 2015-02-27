class VotesController < ApplicationController

  def upvote
    @question = Question.find(params[:question_id])
    @user = current_user
    @question.upvote_by current_user
    redirect_to question_path(@question)
  end

  def downvote
    @question = Question.find(params[:id])
    @user = current_user
    @question.downvote_by current_user
    redirect_to question_path(@question)
  end

end
