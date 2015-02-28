class Question < ActiveRecord::Base
  acts_as_votable

  scope :recent, -> { order("created_at DESC").limit(5) }

  belongs_to :user
  has_many   :answers
  has_many   :votes, as: :votable

  validates :title,   presence: true
  validates :content, presence: true

  def count_upvotes
    cached_votes_up
    # get_upvotes.count
  end

  def count_downvotes
    cached_votes_down
  end

  def count_total
    cached_weighted_score
  end

end
