class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to question_path(@question)
    else
      render "new"
    end
  end

  # def edit
  #   @question = Question.find(params[:question_id])
  #   @answer = Answer.find(params[:id])
  # end

  # def update
  #   @question = Question.find(params[:question_id])
  #   @answer = Answer.find(params[:id])
  #   @answer.update(answer_params)
  # end

  # def delete
  # end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
