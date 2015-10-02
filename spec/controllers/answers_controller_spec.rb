require 'rails_helper'

describe AnswersController do
  let!(:answer) {create :answer}
  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end

    it "assigns @answer to Answer.new" do
      get :index
      expect(assigns(:answer)).to be_a_new Answer
    end
  end

  context "#show" do
    it "is successful" do
      get :show, :id => answer.id
      expect(response).to be_success
    end

    it "assigns @answer to answer" do
      get :show, :id => answer.id
      expect(assigns(:answer)).to eq answer
    end
  end

end
