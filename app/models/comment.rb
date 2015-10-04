class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  def self.question_comments
    where(:commentable_type => "Question")
  end

  def self.answer_comments
    where(:commentable_type => "Answer")
  end

end
