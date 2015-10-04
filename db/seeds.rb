dian = User.create!(username: "dianpan", password: "test123")
julianna = User.create!(username: "queenB", password: "abc123")
domingo = User.create!(username: "dj-m", password: "yoyoyo123")

10.times do
  new_users = User.create!(username: Faker::Internet.user_name, password: "securepassword")
  5.times do
    new_questions = new_users.questions.create!(title: Faker::Hacker.say_something_smart, text: Faker::Lorem.paragraph)
  end
end

q1 = dian.questions.create!(title: "Why am I not a mutant and how can I become one?", text: "I really don't understand why I can't become one... I want to be a mutant so bad")
q2 = julianna.questions.create!(title: "How can I help all the mutant children?", text: "How can I help them? those special souls")
q3 = domingo.questions.create!(title: "How can I get Storm to notice me?", text: "She is seriously the best")
q4 = dian.questions.create!(title: "Why can't Wolverine die?", text: "Just hypothetically... how would one go about killing him?")
q5 = julianna.questions.create!(title: "Why aren't Wolverine's claws still bone in the future?", text: "Do they mature?")
q6 = domingo.questions.create!(title: "How did Magneto get his powers back?", text: "It's like ok, one day he loses them and then the next day he doesn't wtf mate...")
q7 = dian.questions.create!(title: "Soooo... is Mystique good or bad?", text: "Either way, she's really hot")
q8 = julianna.questions.create!(title: "Does Professor X actually die?", text: "I thought that he was killed by a fire but who knows...")
q9 = domingo.questions.create!(title: "How does Cyclops see anything?", text: "What the heck is up with those glasses he wears")
q10 = dian.questions.create!(title: "What's the big deal about Jean Grey?", text: "Seriously what is up with those hotties, Cyclops and Wolverine fighting over her")
