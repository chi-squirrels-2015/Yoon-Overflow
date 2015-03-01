class UsersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def show
  	# @user = User.find(params[:id])
  	@user = User.friendly.find(params[:id])
  	# @test = @user.questions.order(:timestamps) 
      	@test = @user.questions
      	#@question = Question.order("comments_count, created_at DESC")#needtobefor user only
  end
  
  def edit
    @user = User.friendly.find(params[:id])
  end
end
