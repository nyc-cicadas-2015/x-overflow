require 'rails_helper'

RSpec.describe Question, type: :model do
  # Nice!  Test your validation code is what is expected.
  # These two blocks are good examples of what to test on your AR models
  context 'contains valid data' do
    # subject { User.new }
    it { expect(subject).to validate_presence_of(:text) }
    it { expect(subject).to validate_presence_of(:title) }
  end

  context 'has correct associations' do
    it { expect(subject).to have_many(:answers) }
    it { expect(subject).to have_many(:comments) }
    it { expect(subject).to have_many(:votes) }
    it { expect(subject).to belong_to(:user) }
  end

  let(:question) { FactoryGirl.create(:question) }

  describe '#rating' do
    xit 'should have a rating of 0 if it has 1 upvote and 1 downvote' do
      question.votes.create(votable_direction: 1)
      question.votes.create(votable_direction: -1)
      expect(question.rating).to eq(0)
    end

    xit 'should have a rating of -2 with two downvotes' do
      2.times {question.votes.create(votable_direction: -1)}
      expect(question.rating).to eq(-2)
    end

    xit 'should have a rating of 4 with four upvotes' do
      4.times {question.votes.create(votable_direction: 1)}
      expect(question.rating).to eq(4)
    end
  end

  describe "#has_best_answer?" do
    it 'should return false upon creation' do
      expect(question.has_best_answer?).to be_falsey
    end

    xit 'should return true after user chooses best answer' do
      answer = question.answers.create(FactoryGirl.attributes_for(:answer).merge(best_answer: true))
      question.best_answer_id = answer.id
      expect(question.has_best_answer?).to be_truthy
    end
  end
end
