require 'rails_helper'

describe User do
  it 'validates uniqueness of username' do
    User.create(username:"Foo", password:"test123")
    foo = User.new(username:"Foo", password:"123test")
    foo.should_not be_valid
    foo.errors[:username].should include("has already been taken")
  end

  it 'validates that password is at least 6 characters long' do
    foo = User.new(username:"Foo", password: "test")
    foo.should_not be_valid
  end

end
