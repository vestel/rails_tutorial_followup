namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
    desc "creating users"
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "secret123",
                 password_confirmation: "secret123")
    admin.toggle!(:admin)
    (39+rand(59)).times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      users = User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    puts "Generated "+User.count.to_s+" users"
end

def make_microposts
    desc "generating posts"
    users = User.all(limit: 3+rand(6))
    (10+rand(42)).times do
        content = Faker::Lorem.sentence(5+rand(5))
        users.each { |user| user.microposts.create!(content: content) }
    end
    puts "Generated "+Micropost.count.to_s+" posts"
end

def make_relationships
    desc "building relationships"
    users = User.all
    user  = users.first
    followed_users = users[2..19]
    followers      = users[3..22]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each      { |follower| follower.follow!(user) }
    puts "Generated "+Relationship.count.to_s+" relationships"
end
