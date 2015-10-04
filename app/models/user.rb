class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :username, :unique => true
  validates_presence_of :password, :length => { minimum: 6 }, :on => :create

  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

end
