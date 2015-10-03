FactoryGirl.define do
  factory :question do
    title {Faker::Hacker.say_something_smart}
    text {Faker::Lorem.paragraph}
  end
end
