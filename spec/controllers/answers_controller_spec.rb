require 'rails_helper'

describe AnswersController do
  let!(:answer) {create :answer}
  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end
end
