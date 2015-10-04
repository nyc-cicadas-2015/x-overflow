require 'rails_helper'
describe CommentsController do

  before :each do
    @user = create(:new_user)
    session[:user_id] = @user.id
    @question = Question.create(title: "Question title", text: "What is going on?", user_id: session[:user_id])
  end

  describe 'Comment#create' do
    it 'successfully creates a question comment' do
      expect{ post :create, comment: {text: "this is a comment", commentable_type: "Question", commentable_id: @question.id, user_id: @user.id }
      }.to change(Comment, :count).by(1)
    end
  end



end
