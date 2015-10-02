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

  describe "POST #create" do
    context "valid attributes" do
      it "redirects to root if not logged in" do
        post :create, question: FactoryGirl.attributes_for(:question)
        expect(response).to redirect_to root_path
      end

      it "creates a new question" do
        log_in(user)
        question_attributes = FactoryGirl.attributes_for(:question)
        post :create, question: question_attributes
        expect(Question.last).to have_attributes question_attributes
      end

      it "redirects to a new question's show view page" do
        log_in(user)
        post :create, question: FactoryGirl.attributes_for(:question)
        expect(response).to redirect_to(question_path(Question.last))
      end
    end

    context "invalid attributes" do
      it "doesn't create a post with invalid attributes" do
        log_in(FactoryGirl.create(:user))
        question_attributes = { text: nil }
        post :create, question: question_attributes
        expect(response).to redirect_to new_question_path
      end
    end
  end

  describe "GET #edit" do
    it "renders an edit when logged in" do
      log_in(user)
      get :edit, id: question
      expect(response).to render_template :edit
    end
    it "located the requested question" do
      get :edit, id: question
      expect(assigns(:question)).to eq(question)
    end
    it "redirects to the home page if not logged in" do
      get :edit, id: question
      expect(response).to redirect_to root_path
    end
  end

  describe "PUT #update" do
    before :each do
      @question = FactoryGirl.create(:question, text: "Text")
    end

    context "valid attributes" do
      it "located the specific question" do
        put :update, id: @question
        expect(assigns(:question)).to eq(@question)
      end

      it "changes the question's attributes" do
        log_in(user)
        put :update, id: @question, question: FactoryGirl.attributes_for(:question, text: "Updated text")
        @question.reload
        expect(@question.text).to eq("Updated text")
      end

      it "redirects to the updated question" do
        log_in(user)
        put :update, id: @question, question: FactoryGirl.attributes_for(:question)
        expect(response).to redirect_to root_path
      end
    end

    context "invalid attributes" do
      it "locates the requested question" do
        put :update, id: @question
        expect(assigns(:question)).to eq(@question)
      end

      it "does not change the the question's attributes" do
        log_in(user)
        put :update, id: @question, question: FactoryGirl.attributes_for(:question, text: nil)
        @question.reload
        expect(@question.text).to eq("Text")
      end

      it "redirects to the edit view" do
        log_in(user)
        put :update, id: @question, question: FactoryGirl.attributes_for(:question, text: nil)
        expect(response).to redirect_to edit_question_path(@question)
      end
    end
  end


end
