class Question < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(5) }

  belongs_to :user
  has_many   :answers
  has_many   :votes, as: :votable

  validates :title,   presence: true#, message: "Title is a required field"
  validates :content, presence: true#, message: "Your question needs to have content"
end
