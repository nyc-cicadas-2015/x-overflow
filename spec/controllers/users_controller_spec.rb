require 'rails_helper'

describe UsersController do
  describe 'GET#new' do
    it "creates a new user" do
      get :new
      expect(assigns(:user)).to be_a(User)
      end
    end

  describe 'GET#show' do
    before(:each) { @user = create(:user) }
    it "displays a specific user's profile page" do
      get :show, id: @user.id
      expect(assigns(:user).id).to be(@user.id)
      end
    end

  describe 'POST#create' do
    describe "when successful" do
      let(:user_params) { { user: attributes_for(:user) } }

      it "creates a user" do
        post(:create, user_params)
        expect(response).to redirect_to(root_path)
      end
    end
  end


end
