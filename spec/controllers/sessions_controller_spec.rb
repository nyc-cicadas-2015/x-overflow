require 'rails_helper'

describe SessionsController do

  describe 'GET#create' do
    describe 'when successful' do
      before(:each) {
        @user = create(:user)
        post :create, session: { username: user[:username], password: user[:password] }
      }
      let(:user) { attributes_for(:user) }

      it 'returns http success' do
        expect(response).to redirect_to root_path
      end

      it 'sets the session user_id' do
        expect(session).to have_key :user_id
      end

      it 'sets the session user_id to the user.id' do
        expect(session[:user_id]).to eq @user.id
      end

      it 'triggers a flash message welcoming user' do
        expect(flash[:message]).to have_content "Welcome #{@user.username}"
      end
    end
  end


  describe 'when unsuccessful' do
    it 'redirects user to root path' do
      post :create, session: { username: nil, password: nil }
      expect(response).to redirect_to root_path
    end


  end

end


