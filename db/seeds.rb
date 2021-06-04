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
my_categories = Category.create([{ title: 'Первая категория' }, { title: 'Вторая категория' }])
my_users = User.create([{ name: 'Имя 1', email: 'name1@email.com' }, { name: 'Имя 3', email: 'name2@email.com' },
                        { name: 'Имя 2', email: 'name3@email.com' }, { name: 'Имя 4', email: 'name4@email.com' }])
my_tests = Test.create([{ title: 'Тест 1', level: 4, category_id: my_categories[0].id, author_id: my_users[0].id },
                        { title: 'Тест 2', level: 3, category_id: my_categories[1].id, author_id: my_users[1].id },
                        { title: 'Тест 3', level: 2, category_id: my_categories[0].id, author_id: my_users[0].id },
                        { title: 'Тест 4', level: 4, category_id: my_categories[1].id, author_id: my_users[1].id }])
my_questions = Question.create([{ body: 'Вопрос 1 тест 1', test_id: my_tests[0].id },
                                { body: 'Вопрос 1 тест 2', test_id: my_tests[0].id },
                                { body: 'Вопрос 2 тест 1', test_id: my_tests[1].id },
                                { body: 'Вопрос 2 тест 2', test_id: my_tests[1].id },
                                { body: 'Вопрос 3 тест 1', test_id: my_tests[2].id },
                                { body: 'Вопрос 3 тест 2', test_id: my_tests[2].id },
                                { body: 'Вопрос 4 тест 1', test_id: my_tests[3].id },
                                { body: 'Вопрос 4 тест 2', test_id: my_tests[3].id }])
Answer.create([{ body: 'Вариант 1', correct: true,  question_id: my_questions[0].id },
               { body: 'Вариант 2', correct: false, question_id: my_questions[0].id },
               { body: 'Вариант 1', correct: true,  question_id: my_questions[1].id },
               { body: 'Вариант 2', correct: false, question_id: my_questions[1].id },
               { body: 'Вариант 1', correct: true,  question_id: my_questions[2].id },
               { body: 'Вариант 2', correct: false, question_id: my_questions[2].id },
               { body: 'Вариант 1', correct: true,  question_id: my_questions[3].id },
               { body: 'Вариант 2', correct: false, question_id: my_questions[3].id },
               { body: 'Вариант 1', correct: false, question_id: my_questions[4].id },
               { body: 'Вариант 2', correct: true,  question_id: my_questions[4].id },
               { body: 'Вариант 1', correct: false, question_id: my_questions[5].id },
               { body: 'Вариант 2', correct: true,  question_id: my_questions[5].id },
               { body: 'Вариант 1', correct: false, question_id: my_questions[6].id },
               { body: 'Вариант 2', correct: true,  question_id: my_questions[6].id },
               { body: 'Вариант 1', correct: false, question_id: my_questions[7].id },
               { body: 'Вариант 2', correct: true,  question_id: my_questions[7].id }])
TestTaker.create([{ user_id: my_users[0].id, test_id: my_tests[1].id },
                  { user_id: my_users[1].id, test_id: my_tests[3].id },
                  { user_id: my_users[2].id, test_id: my_tests[0].id },
                  { user_id: my_users[3].id, test_id: my_tests[2].id },
                  { user_id: my_users[1].id, test_id: my_tests[0].id },
                  { user_id: my_users[2].id, test_id: my_tests[1].id },
                  { user_id: my_users[2].id, test_id: my_tests[3].id }])
