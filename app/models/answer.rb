class Answer < ActiveRecord::Base
  acts_as_votable

  belongs_to :question
  belongs_to :user
  has_many   :votes, as: :votable

  validates :content, presence: true
end
