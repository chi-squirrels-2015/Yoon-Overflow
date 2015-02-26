class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully deleted.'
  end
end
