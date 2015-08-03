5.times do
  name = Faker::Lorem.sentence(5)
  description = Faker::Lorem.sentence(5)
  Category.create! name: name, description: description
end

categories = Category.order(:created_at).take(5)
10.times do
  name = Faker::Lorem.sentence(5)
  categories.each {|category| category.lessons.create! name: name}
end

10.times do
  categories.each do |category|
    content = Faker::Lorem.sentence(2)
    category.words.create! content: content
  end
end

words = Word.all
words.each do |word|
  4.times do |i|
    content = Faker::Lorem.sentence(2)
    is_true = i>0 ? false : true
    word.answers.create! content: content, correct: is_true
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
