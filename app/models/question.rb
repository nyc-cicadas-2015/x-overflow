class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def self.order_by_recent
    self.order(created_at: :desc)
  end

end
