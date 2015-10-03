class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates_presence_of :votable_direction
  validates_inclusion_of :votable_direction, :in => [-1, 1]
end
