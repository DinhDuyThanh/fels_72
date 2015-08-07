5.times do
  name = Faker::Lorem.sentence(5)
  description = Faker::Lorem.sentence(5)
  Category.create! name: name, description: description
end

categories = Category.all
categories.each do |category|
  5.times do
    name = Faker::Lorem.sentence(5)
    description = Faker::Lorem.sentence(5)
    category.lessons.create! name: name
  end
end

lessons = Lesson.all
lessons.each do |lesson|
  10.times do
    content = Faker::Lorem.sentence(2)
    lesson.words.create! content: content, category_id: lesson.category_id
  end
end

words = Word.all
words.each do |word|
  4.times do |i|
    correct = i > 0 ? false : true
    content = Faker::Lorem.sentence(2)
    word.answers.create! content: content, correct: correct
  end
end

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true
            )

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              admin: false
              )
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow followed}
followers.each {|follower| follower.follow user}
