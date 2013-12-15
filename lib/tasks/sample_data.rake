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
    30.times do |n|
      name  = Faker::Name.name
      nameC = Faker::Name.first_name
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
      Company.create!(name: nameC,
                      homepage: "ssss",
                      description: "desc"
      )
    end
      users = User.all
      companies = Company.all
      company = companies.first

      members_users      = users[3..20]

      members_users.each      { |user_m| user_m.member!(company, false, false) }
      User.first.member!(company, true, false)
      User.last.member!(company, false, true)


    users = User.all
    user  = users.first
    contactee_users = users[2..20]
    contacts      = users[3..20]
    contactee_users.each { |contactee| user.contact!(contactee, true) }
    contacts.each      { |contact| contact.contact!(user, true) }



  end
end
