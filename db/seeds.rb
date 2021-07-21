# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category.destroy_all
# User.destroy_all
# Badge.destroy_all
categories = Category.create!([{ title: 'Первая категория' }, { title: 'Вторая категория' }])

users = User.create!([{ name: 'Имя 1', email: 'name1@email.com', password: '111111' },
                      { name: 'Имя 3', email: 'name2@email.com', password: '222222' },
                      { name: 'Имя 2', email: 'name3@email.com', password: '333333' },
                      { name: 'Имя 4', email: 'name4@email.com', password: '444444' }])

tests = Test.create!([{ title: 'Тест 1', level: 4, category: categories[0], author: users[0] },
                      { title: 'Тест 2', level: 3, category: categories[1], author: users[0] },
                      { title: 'Тест 3', level: 2, category: categories[0], author: users[1] },
                      { title: 'Тест 4', level: 4, category: categories[1], author: users[1] }])

questions = Question.create!([{ body: 'Вопрос 1', test: tests[0] },
                              { body: 'Вопрос 2', test: tests[0] },
                              { body: 'Вопрос 1', test: tests[1] },
                              { body: 'Вопрос 2', test: tests[1] },
                              { body: 'Вопрос 1', test: tests[2] },
                              { body: 'Вопрос 2', test: tests[2] },
                              { body: 'Вопрос 1', test: tests[3] },
                              { body: 'Вопрос 2', test: tests[3] }])

Answer.create!([{ body: 'Вариант 1', correct: true,  question: questions[0] },
                { body: 'Вариант 2', correct: false, question: questions[0] },
                { body: 'Вариант 1', correct: true,  question: questions[1] },
                { body: 'Вариант 2', correct: false, question: questions[1] },
                { body: 'Вариант 1', correct: true,  question: questions[2] },
                { body: 'Вариант 2', correct: false, question: questions[2] },
                { body: 'Вариант 1', correct: true,  question: questions[3] },
                { body: 'Вариант 2', correct: false, question: questions[3] },
                { body: 'Вариант 1', correct: false, question: questions[4] },
                { body: 'Вариант 2', correct: true,  question: questions[4] },
                { body: 'Вариант 1', correct: false, question: questions[5] },
                { body: 'Вариант 2', correct: true,  question: questions[5] },
                { body: 'Вариант 1', correct: false, question: questions[6] },
                { body: 'Вариант 2', correct: true,  question: questions[6] },
                { body: 'Вариант 1', correct: false, question: questions[7] },
                { body: 'Вариант 2', correct: true,  question: questions[7] }])

TestTaker.create!([{ user: users[0], test: tests[1] },
                   { user: users[1], test: tests[3] },
                   { user: users[2], test: tests[0] },
                   { user: users[3], test: tests[2] },
                   { user: users[1], test: tests[0] },
                   { user: users[2], test: tests[1] },
                   { user: users[2], test: tests[3] }])

Badge.create!([{ title: "Гуру #{categories[0].title}",
                 description: "Пройдите все тесты в #{categories[0].title}",
                 rule: 'all_tests_from_the_category',
                 rule_value: categories[0].id.to_s,
                 image_url: 'app/assets/images/badges/image1' },
               { title: "Гуру #{tests[0].level} уровня",
                 description: "Пройдите все тесты #{tests[0].level} уровня",
                 rule: 'all_tests_of_the_level',
                 rule_value: tests[0].level.to_s,
                 image_url: 'app/assets/images/badges/image2' },
               { title: "#{tests[0].title} гуру",
                 description: "Пройдите #{tests[0].title} с первой попытки",
                 rule: 'test_on_first_attempt',
                 rule_value: tests[0].id.to_s,
                 image_url: 'app/assets/images/badges/image3' }])
