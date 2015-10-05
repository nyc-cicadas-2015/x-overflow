require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  def create_question_upvote
    @question = FactoryGirl.create(:question)
    @user = FactoryGirl.create(:user)
    @vote = Vote.new(votable_direction: 1)
    @vote_attributes = @vote.attributes
  end

  def create_question_downvote
    @question = FactoryGirl.create(:question)
    @user = FactoryGirl.create(:user)
    @vote = Vote.new(votable_direction: -1)
    @vote_attributes = @vote.attributes
  end

  def create_answer_upvote
    @question = FactoryGirl.create(:question)
    @answer = @question.answers.create(text: "This is my answer")
    @user = FactoryGirl.create(:user)
    @vote = Vote.new(votable_direction: 1)
    @vote_attributes = @vote.attributes
  end

  def create_answer_downvote
    @question = FactoryGirl.create(:question)
    @answer = @question.answers.create(text: "This is my answer")
    @user = FactoryGirl.create(:user)
    @vote = Vote.new(votable_direction: -1)
    @vote_attributes = @vote.attributes
  end
end
