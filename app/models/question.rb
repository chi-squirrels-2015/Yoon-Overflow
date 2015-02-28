class Question < ActiveRecord::Base
  # acts_as_votable

  scope :recent, -> { order("created_at DESC").limit(5) }

  belongs_to :user
  has_many   :answers
  has_many   :votes, as: :votable
  has_many   :comments, as: :commentable

  validates :title,   presence: true
  validates :content, presence: true

  def question_upvote
    self.vote + 1
  end

    def question_downvote
    self.vote - 1
  end

end
