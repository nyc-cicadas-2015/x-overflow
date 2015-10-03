class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username
  validates_presence_of :username
  validates :password, :presence => true, :length => { minimum: 6 }, :on => :create

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
end
