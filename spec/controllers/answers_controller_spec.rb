require 'rails_helper'

describe AnswersController do
  before(:each) { session[:user_id] = user.id }

  let!(:user) { FactoryGirl.create :user }
  let!(:question) { FactoryGirl.create :question, :user_id => user.id }
  let!(:answer) { FactoryGirl.create :answer, :question_id => question.id, :user_id => user.id }

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

  context "#create" do
    it "with valid attributes" do
      expect {
        post :create, :user_id => user.id, :question_id => question.id, :answer => attributes_for(:answer)
        expect(response).to be_redirect
      }.to change {Answer.count}.by(1)
    end

    it "without valid attributes" do
      expect {
        post :create, :user_id => user.id, :question_id => question.id, :answer => { :text => nil }
      }.to_not change {Answer.count}
    end
  end

  context "#edit" do
    it "is successful" do
      get :edit, :id => answer.id
      expect(response).to be_success
    end
  end

  context "#destroy" do
    it "deletes the answer" do
      expect{
        delete :destroy, id: answer
      }.to change {Answer.count}.by(-1)
    end
  end
end
