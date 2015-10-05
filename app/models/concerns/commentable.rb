module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end

  # Let's help out our controllers by defining a "question" method on both the
  # Question and Answer classes (anything that can be Commentable)
  def question
    self.kind_of?(Question) ? self : question
  end
end

module Smilable
  extend ActiveSupport::Concern

  included do
    ## This code runs in the class scope at the time of inclusion
  end

  module ClassMethods
    ## Instance methods defined here will be included as class methods
  end

  def method
    ## All other methods will be included as instance methods
  end
end
