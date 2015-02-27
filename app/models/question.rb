class Question < ActiveRecord::Base
  acts_as_votable

  scope :recent, -> { order("created_at DESC").limit(5) }

  belongs_to :user
  has_many   :answers
  has_many   :votes, as: :votable

  validates :title,   presence: true
  validates :content, presence: true

  def count_upvotes
    get_upvotes.count
  end

  def count_downvotes
    get_downvotes.count
  end

  def count_total
    get_upvotes.count - get_downvotes.count
  end

>>>>>>> upvotes and downvotes are saving to db and working
end
