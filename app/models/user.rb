class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username
  validates :password, :presence => true, :length => { minimum: 6 }, :on => :create
  validates :username, length: { maximum: 50 }

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
end
