require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:question) { FactoryGirl.create :question }
  let(:user) { FactoryGirl.create :user }

  describe "GET #index" do
    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "displays questions in recent order" do
      get :index
      expect(assigns(:questions)).to eq(Question.order_by_recent)
    end
  end

  describe "GET #show" do
    it "render the show view" do
      get :show, id: question
      expect(response).to render_template :show
    end

    it "located the requested question" do
      get :show, id: question
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "GET #new" do
    it "renders the new view when logged in" do
      log_in(user)
      get :new
      expect(response).to render_template :new
    end

    it "redirects to root if not logged in" do
      get :new
      expect(response).to redirect_to root_path
    end
  end


end
