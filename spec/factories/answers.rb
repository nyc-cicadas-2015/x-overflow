FactoryGirl.define do
  factory :answer do
    question_id {Faker::Number.between(1, 10)}
    user_id {Faker::Number.between(1, 10)}
    text {Faker::Hacker.say_something_smart}
  end
end
