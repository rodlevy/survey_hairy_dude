users = []

users << User.create(username: "test", email: "test@test.com", 
                     password_hash: BCrypt::Password.create("test"))

10.times do
  users << User.create(:username => Faker::Internet.user_name,
              :email =>   Faker::Internet.email,
              :password_hash  => BCrypt::Password.create("test"))
end

surveys = []

20.times do
  surveys << Survey.create(name: Faker::Company.catch_phrase,
                           user_id: users.sample.id)
end


questions = []

surveys.each do |survey|
  (rand(8)+1).times do
    questions << Question.create(content: Faker::Lorem.sentence(word_count = 4),
                                 survey_id: survey.id)
  end
end


answers = []

questions.each do |question|
  (rand(4)+2).times do
    answers << Answer.create(content: Faker::Lorem.word,
                             question_id: question.id)
  end
end



users.each do |user|
  3.times do 
    survey = surveys.sample
    survey.questions.each do |question|
      answer = question.answers.sample
      Response.create(user_id: user.id,
                      question_id: question.id,
                      answer_id: answer.id)
    end
  end
end
