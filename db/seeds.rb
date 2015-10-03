dian = User.create(username: "dianpan", password: "test123")
julianna = User.create(username: "queenB", password: "abc123")
domingo = User.create(username: "dj-m", password: "yoyoyo123")

10.times do
  new_user = User.create(username: Faker::Internet.user_name, password: "securepassword")
  5.times do
    new_user.questions.create(text: Faker::Hacker.say_something_smart)
  end
end


q1 = dian.questions.create(text: "Why am I not a mutant and how can I become one?")
q2 = julianna.questions.create(text: "How can I help all the mutant children?")
q3 = domingo.questions.create(text: "How can I get Storm to notice me?")
q4 = dian.questions.create(text: "Why can't Wolverine die?")
q5 = julianna.questions.create(text: "Why aren't Wolverine's claws still bone in the future?")
q6 = domingo.questions.create(text: "How did Magneto get his powers back?")
q7 = dian.questions.create(text: "Soooo... is Mystique good or bad?")
q8 = julianna.questions.create(text: "Does Professor X actually die?")
q9 = domingo.questions.create(text: "How does Cyclops see anything?")
q10 = dian.questions.create(text: "What's the big deal about Jean Grey? Why does Is the rivalry between Cyclops and Wolverine p")
