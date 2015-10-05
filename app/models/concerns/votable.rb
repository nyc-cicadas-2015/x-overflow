module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def votes_per_hour
    votes.select {|vote| vote.created_at < 1.hour.ago}.count
  end

  def rating
    votes.pluck(:votable_direction).reduce(:+) || 0
  end

  module ClassMethods
    def order_by_trending
      all.sort {|q1, q2| q2.votes_per_hour <=> q1.votes_per_hour}
    end

    def order_by_votes
      all.sort {|q1, q2| q2.rating <=> q1.rating}
    end
  end
end
