class StaticController < ApplicationController

  def index
<<<<<<< HEAD
    @questions = Question.order(created_at: :desc)
=======
    @questions = Question.order(cached_votes_total: :desc)
>>>>>>> votes are incrementing but it is not subtracting to decrement
  end

end
