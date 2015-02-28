class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many   :votes, as: :votable
  has_many   :comments, as: :commentable

  validates :content, presence: true

end
