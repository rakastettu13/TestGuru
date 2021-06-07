# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TestTaker.delete_all
# Answer.delete_all
# Question.delete_all
# Test.delete_all
# User.delete_all
# Category.delete_all
categories = Category.create!([{ title: 'Первая категория' }, { title: 'Вторая категория' }])
users = User.create!([{ name: 'Имя 1', email: 'name1@email.com' }, { name: 'Имя 3', email: 'name2@email.com' },
                      { name: 'Имя 2', email: 'name3@email.com' }, { name: 'Имя 4', email: 'name4@email.com' }])
tests = Test.create!([{ title: 'Тест 1', level: 4, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'Тест 2', level: 3, category_id: categories[1].id, author_id: users[1].id },
                      { title: 'Тест 3', level: 2, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'Тест 4', level: 4, category_id: categories[1].id, author_id: users[1].id }])
questions = Question.create!([{ body: 'Вопрос 1 тест 1', test_id: tests[0].id },
                              { body: 'Вопрос 1 тест 2', test_id: tests[0].id },
                              { body: 'Вопрос 2 тест 1', test_id: tests[1].id },
                              { body: 'Вопрос 2 тест 2', test_id: tests[1].id },
                              { body: 'Вопрос 3 тест 1', test_id: tests[2].id },
                              { body: 'Вопрос 3 тест 2', test_id: tests[2].id },
                              { body: 'Вопрос 4 тест 1', test_id: tests[3].id },
                              { body: 'Вопрос 4 тест 2', test_id: tests[3].id }])
Answer.create!([{ body: 'Вариант 1', correct: true,  question_id: questions[0].id },
                { body: 'Вариант 2', correct: false, question_id: questions[0].id },
                { body: 'Вариант 1', correct: true,  question_id: questions[1].id },
                { body: 'Вариант 2', correct: false, question_id: questions[1].id },
                { body: 'Вариант 1', correct: true,  question_id: questions[2].id },
                { body: 'Вариант 2', correct: false, question_id: questions[2].id },
                { body: 'Вариант 1', correct: true,  question_id: questions[3].id },
                { body: 'Вариант 2', correct: false, question_id: questions[3].id },
                { body: 'Вариант 1', correct: false, question_id: questions[4].id },
                { body: 'Вариант 2', correct: true,  question_id: questions[4].id },
                { body: 'Вариант 1', correct: false, question_id: questions[5].id },
                { body: 'Вариант 2', correct: true,  question_id: questions[5].id },
                { body: 'Вариант 1', correct: false, question_id: questions[6].id },
                { body: 'Вариант 2', correct: true,  question_id: questions[6].id },
                { body: 'Вариант 1', correct: false, question_id: questions[7].id },
                { body: 'Вариант 2', correct: true,  question_id: questions[7].id }])
TestTaker.create!([{ user_id: users[0].id, test_id: tests[1].id },
                   { user_id: users[1].id, test_id: tests[3].id },
                   { user_id: users[2].id, test_id: tests[0].id },
                   { user_id: users[3].id, test_id: tests[2].id },
                   { user_id: users[1].id, test_id: tests[0].id },
                   { user_id: users[2].id, test_id: tests[1].id },
                   { user_id: users[2].id, test_id: tests[3].id }])
