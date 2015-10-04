require 'rails_helper'
describe CommentsController do

  before :each do
    @user = create(:new_user)
    session[:user_id] = @user.id
    @question = Question.create(title: "Question title", text: "What is going on?", user_id: session[:user_id])
  end

  describe 'POST #create' do
    describe 'when successful' do
      it 'increases the number of comments in the database by 1' do
        expect{ post :create, comment: {text: "this is a comment", commentable_type: "Question", commentable_id: @question.id, user_id: @user.id }
        }.to change{Comment.count}.by(1)
      end

      it 'sets a flash message upon successful creation' do
        post :create, comment: {text: "this is a comment", commentable_type: "Question", commentable_id: @question.id, user_id: @user.id }
        expect(flash[:alert]).to have_content "Success!"
      end
    end
  end

end
