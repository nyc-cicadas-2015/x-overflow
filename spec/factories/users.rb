FactoryGirl.define do
  factory :user do
    username Faker::Internet.email
    password Faker::Internet.password(8)
  end

  factory :new_user do
    username { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end

end
