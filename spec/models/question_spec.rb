require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'contains valid data' do
    it { expect(subject).to validate_presence_of(:text) }
    it { expect(subject).to validate_presence_of(:title) }
  end

  context 'has correct associations' do
    it { expect(subject).to have_many(:answers) }
    it { expect(subject).to have_many(:comments) }
    it { expect(subject).to have_many(:votes) }
    it { expect(subject).to belong_to(:user) }
  end

end
