namespace :db do
  task populate: :environment do
    admin = User.create!(name: "Administrator",
                         age: 30,
                         country: "PT",
                         description: "default_desc",
                         email: "admin@mail.com",
                         picture: "none",
                         password: "passadmin",
                         password_confirmation: "passadmin",
                         admin: true)
    User.create!(name: "default_user",
                 age: 20,
                 country: "PT",
                 description: "default_desc",
                 email: "default1@mail.com",
                 picture: "none",
                 password: "default",
                 password_confirmation: "default")
    99.times do |n|
      name  = Faker::Name.name
      age = 20
      country = "PT"
      description = "desc"
      email = "example-#{n+1}@mail.com"
      picture = "none"
      password  = "default"
      User.create!(name: name,
                   age: age,
                   country: country,
                   description: description,
                   email: email,
                   picture: picture,
                   password: password,
                   password_confirmation: password)
      News.create!( title: "News",
                    content: "Lorem ipsum...",
                    photo: "none",
                    user_id: 1
      )
    end
  end
end
