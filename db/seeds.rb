require 'rainbow/refinement'
using Rainbow

puts '[Seed::Users] Создаем пользователей'.red

u1 = User.create! email: 'admin1@gmail.com', password: '123456'
p1 = u1.build_profile first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Quote.yoda
p1.save
u1.add_role :admin

u2 = User.create! email: 'admin2@gmail.com', password: '123456'
p2 = u2.build_profile first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Quote.yoda
p2.save
u2.add_role :admin

u3 = User.create! email: 'user1@gmail.com', password: '123456'
p3 = u3.build_profile first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Quote.yoda
p3.save
u3.add_role :user

u4 = User.create! email: 'user2@gmail.com', password: '123456'
p4 = u4.build_profile first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Quote.yoda
p4.save
u4.add_role :user

u5 = User.create! email: 'teacher1@gmail.com', password: '123456'
p5 = u5.build_profile first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Quote.yoda
p5.save
u5.add_role :teacher

u6 = User.create! email: 'teacher2@gmail.com', password: '123456'
p6 = u6.build_profile first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Quote.yoda
p6.save
u6.add_role :teacher

u7 = User.create! email: 'teacher3@gmail.com', password: '123456'
p7 = u7.build_profile first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Quote.yoda
p7.save
u7.add_role :teacher

u8 = User.create! email: 'teacher4@gmail.com', password: '123456'
p8 = u8.build_profile first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Quote.yoda
p8.save
u8.add_role :teacher