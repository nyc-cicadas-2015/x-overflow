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



end
