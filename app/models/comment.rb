class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  include Votable

  def self.question_comments
    where(:commentable_type => "Question")
  end

  def self.answer_comments
    where(:commentable_type => "Answer")
  end
end
