class AddCurrentQuestionCorrectQuestionsToTestTakers < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_takers, :current_question, foreign_key: { to_table: :questions }
    add_column :test_takers, :correct_questions, :integer, default: 0, null: false
  end
end
