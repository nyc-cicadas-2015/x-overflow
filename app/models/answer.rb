class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  validates_presence_of :text

  include Commentable
  include Votable
end


