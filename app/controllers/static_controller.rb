class StaticController < ApplicationController

  def index
    @questions = Question.page(params[:page]).per(10)
  end

end
