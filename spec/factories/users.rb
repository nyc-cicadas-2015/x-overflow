FactoryGirl.define do
  factory :user do
  sequence(:username) { |n| "person_#{n}@example.com" }
  password "foobar"
  end

  factory :new_user do
    username { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end

end
