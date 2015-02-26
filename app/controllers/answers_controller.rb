class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    redirect_to question_path(@question)
  end

  # def edit
  # end

  # def update
  # end

  # def delete
  # end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
