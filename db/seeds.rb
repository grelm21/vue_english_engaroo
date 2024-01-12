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

puts '[Seed::Courses] Создаем курсы'.red
course1 = Course.create!(title: 'Go Getter 1',
                         description: 'Курс для младших подростков от Oxford',
                         language: 0,
                         status: 1,
                         availability: 0,
                         user: u1)

puts '[Seed::Lessons] Создаем уроки'.red
lesson1 = Lesson.create(title: 'Intro lesson',
                        description: 'Вводный урок для оценки уровня ученика',
                        # order: 1,
                        demo: true,
                        course: course1)

lesson2 = Lesson.create(title: '1A to be',
                        description: 'to be verb and basic phrases',
                        # order: 2,
                        demo: true,
                        course: course1)

lesson3 = Lesson.create(title: '1B to be negative',
                        description: 'to be revision and negative to be form',
                        # order: 3,
                        demo: true,
                        course: course1)

lesson4 = Lesson.create(title: '2A basic adjectives',
                        description: 'adjectives to describe people',
                        # order: 4,
                        demo: true,
                        course: course1)

lesson5 = Lesson.create(title: '2B Communication',
                        description: 'practice speaking (introduction, talking about yourself)',
                        # order: 5,
                        demo: true,
                        course: course1)

lesson6 = Lesson.create(title: '1 and 2 test',
                        description: 'assignment to check',
                        # order: 6,
                        demo: true,
                        course: course1)

course2 = Course.create!(title: 'Уровень выживания: Английский язык',
                         description: 'Для тех, кому английский нужен срочно - здесь и сейчас',
                         language: 0,
                         status: 1,
                         availability: 0,
                         user: u2)

course3 = Course.create!(title: 'Perspectives 1',
                         description: 'Начальный курс американского английского для подростков',
                         language: 0,
                         status: 1,
                         availability: 0,
                         user: u5)

course4 = Course.create!(title: 'Minna no nihongo 1',
                         description: 'Начальный курс японского языка основанный на учебнике MNN1',
                         language: 0,
                         status: 1,
                         availability: 0,
                         user: u6)

course5 = Course.create!(title: 'CAE',
                         description: 'Курс продвинутого английского для отчаянных',
                         language: 0,
                         status: 1,
                         availability: 0,
                         user: u1)

course6 = Course.create!(title: 'Japanese N3',
                         description: 'Подготовка к Нореку Сикен 3 уровня',
                         language: 0,
                         status: 1,
                         availability: 0,
                         user: u8)

course7 = Course.create!(title: 'Own it! 2',
                         description: 'Курс для младших подростков по современному учебнику',
                         language: 0,
                         status: 1,
                         availability: 0,
                         user: u1)


course8 = Course.create!(title: 'Неправильные глаголы в действии',
                         description: 'Марафон по неправильным глаголам английского языка',
                         language: 0,
                         status: 1,
                         availability: 0,
                         user: u1)

