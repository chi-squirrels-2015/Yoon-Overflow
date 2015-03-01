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

  def update
    @user = User.friendly.find(params[:id])
    @user.update(user_params)

    if @user.save
      redirect_to @user, notice: "Your Profile was successfully updated. :D"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar_url, :bio)
  end
end
