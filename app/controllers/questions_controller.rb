class QuestionsController < ApplicationController
  respond_to :html, :js

  def index
    redirect_to "/"
  end

  def show
    @question = Question.friendly.find(params[:id])
    @answer   = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.friendly.find(params[:id])
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
    @question = Question.friendly.find(params[:id])
    @question.update(question_params)

    if @question.save
      redirect_to @question, notice: "Quesiton was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @question = Question.friendly.find(params[:id])
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully deleted.'
  end
 #### NEW #### rachel jd
   def upvote
    @question = Question.friendly.find(params[:id])
    @user = current_user
    @question.votes << Vote.create(voter_id: @user.id)
    redirect_to(root_path)
  end


  def downvote
    @question = Question.friendly.find(params[:id])
    @user = current_user
    @question.votes.where(voter_id = @user.id).destroy
    redirect_to question_path(@question)
  end

  ########
  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
