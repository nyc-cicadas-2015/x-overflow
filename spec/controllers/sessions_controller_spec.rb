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


    end
  end

end


