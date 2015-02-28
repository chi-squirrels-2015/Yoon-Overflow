class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer   = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)

    if @question.save
      redirect_to @question, notice: "Quesiton was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully deleted.'
  end

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

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
