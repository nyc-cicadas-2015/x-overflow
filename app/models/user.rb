class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
end
