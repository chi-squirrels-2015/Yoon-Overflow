class Question < ActiveRecord::Base
  # acts_as_votable

  scope :recent, -> { order("created_at DESC").limit(5) }

  belongs_to :user
  has_many   :answers
  has_many   :votes, as: :votable
  has_many :comments, as: :commentable

  validates :title,   presence: true
  validates :content, presence: true
  extend FriendlyId
  friendly_id :title, use: :slugged

  def count_upvotes
    get_upvotes.count
  end

  def count_downvotes
    get_downvotes.count
  end

  def count_total
    get_upvotes.count - get_downvotes.count
  end

end
