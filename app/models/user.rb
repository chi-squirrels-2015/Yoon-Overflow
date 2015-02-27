class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
  has_many :questions
  has_many :given_answers, class_name: 'Answer'
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :email, uniqueness: true
end
