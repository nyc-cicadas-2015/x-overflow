FactoryGirl.define do
  factory :answer do
    text {Faker::Hacker.say_something_smart}

    # You can just say:
    #
    # user
    # question
    #
    # if you've stuck to the conventions (you have) it will "just work" (tm)
    association :user, factory: :user
    association :question, factory: :question
  end
end
