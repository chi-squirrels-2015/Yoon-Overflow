class Question < ActiveRecord::Base
  acts_as_votable

  scope :recent, -> { order("created_at DESC").limit(5) }

  belongs_to :user
  has_many   :answers
  has_many   :votes, as: :votable

  validates :title,   presence: true
  validates :content, presence: true
end
