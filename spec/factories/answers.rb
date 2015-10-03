FactoryGirl.define do
  factory :answer do
    text {Faker::Hacker.say_something_smart}
    association :user, factory: :user
    association :question, factory: :question
  end
end
