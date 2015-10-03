class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def self.order_by_recent
    self.order(created_at: :desc)
  end

  def votes_per_hour
    votes.select {|vote| vote.created_at < 1.hour.ago}.count
  end

  def self.order_by_trending
    self.all.sort {|q1, q2| q2.votes_per_hour <=> q1.votes_per_hour}
  end

  def self.order_by_votes
    self.all.sort {|q1, q2| q2.rating <=> q1.rating}
  end

  def rating
    votes.pluck(:value).reduce(:+) || 0
  end

  def has_best_answer?
    best_answer_id
  end

end
