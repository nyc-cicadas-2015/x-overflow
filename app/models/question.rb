class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :text, :title

  def self.order_by_recent
    order(created_at: :desc)
  end

  def votes_per_hour
    votes.select {|vote| vote.created_at < 1.hour.ago}.count
  end

  def self.order_by_trending
    all.sort {|q1, q2| q2.votes_per_hour <=> q1.votes_per_hour}
  end

  def self.order_by_votes
    all.sort {|q1, q2| q2.rating <=> q1.rating}
  end

  def rating
    votes.pluck(:votable_direction).reduce(:+) || 0
  end

  def has_best_answer?
    best_answer_id
  end

  def timestamp
    milliseconds = self.created_at.to_i/1000
    seconds = milliseconds/1000
    minutes = seconds/60
    hours = minutes/60
    days = hours/24

    if minutes == 0
      return "#{seconds} seconds"
    elsif hours == 0
      return "#{minutes} minutes"
    elsif days == 0
      return "#{hours} hours"
    else
      return "#{days} days"
    end
  end

end
