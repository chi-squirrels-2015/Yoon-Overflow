class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  # def create
  # end

  # def edit
  # end

  # def update
  # end

  # def delete
  # end
end
