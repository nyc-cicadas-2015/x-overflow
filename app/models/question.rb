class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates_presence_of :text, :title

  # Moved the Commentable and Votable code to concerns.  So much cleaner!
  include Commentable
  include Votable

  def self.order_by_recent
    self.order(created_at: :desc)
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
