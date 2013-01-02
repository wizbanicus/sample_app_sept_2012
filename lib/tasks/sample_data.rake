namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end  
end

def make_users
  admin = User.create!( name: "Example user",
                        email: "example@example.com",
                        password: "foobarbaz", 
                        password_confirmation: "foobarbaz")
  admin.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "example#{n+1}@example.com"
    password = "password"
    User.create!(name: name, email: email, password: password,
                password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each do |user|
      user.microposts.create!(content: content)
    end
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed_user| user.follow!(followed_user) }
  followers.each       { |follower| follower.follow!(user) }
end

