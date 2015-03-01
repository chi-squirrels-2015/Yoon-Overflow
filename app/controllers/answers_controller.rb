class AnswersController < ApplicationController

  def new
    @question = Question.friendly.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    # question_answers POST   /questions/:question_id/answers(.:format)          answers#create
    @question = Question.friendly.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question)
    else
      render "new"
    end
  end

  def edit
    @question = Question.friendly.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.friendly.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.friendly.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
