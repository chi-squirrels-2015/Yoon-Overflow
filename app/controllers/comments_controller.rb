class CommentsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = Comment.new(comment_params)
    @comment.author = User.find(current_user.id)
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

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
