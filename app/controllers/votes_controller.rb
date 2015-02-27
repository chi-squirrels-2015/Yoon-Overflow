class VotesController < ApplicationController

  def upvote
    @question = Question.find(params[:question_id])
    @question.upvote_by current_user
    redirect_to question_path(@question)
  end

  def downvote
    @question = Question.find(params[:id])
    @question.upvote_by current_user
    redirect_to question_path(@question)
  end

end
