class CommentsController < ApplicationController

  def question_new
    @question = Question.friendly.find(params[:question_id])
    @comment = Comment.new
  end

  def question
    @question = Question.friendly.find(params[:question_id])
    @comment = Comment.new(comment_params)
    @comment.author = User.friendly.find(current_user.id)
    @comment.commentable_id = @question.id
    @comment.commentable_type = "Question"

    if @comment.save
      # render :show, layout: false
      redirect_to question_path(@question)
    else
      @error = @comment.errors
      render :new
    end
  end

  def answer_new
    @question = Question.friendly.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new
  end

  def answer
    @question = Question.friendly.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new(comment_params)
    @comment.author = User.friendly.find(current_user.id)
    @comment.commentable_id = @answer.id
    @comment.commentable_type = "Answer"

    if @comment.save
      # render :show, layout: false
      redirect_to question_path(@question)
    else
      @error = @comment.errors
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
