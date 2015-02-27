class Answer < ActiveRecord::Base
  acts_as_votable

  belongs_to :question
  belongs_to :user
  has_many   :votes, as: :votable

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

end
