module QuestionsHelper
  def question_header(question, test)
    action = if question.new_record?
               'Create new'
             else
               'Edit'
             end
    "#{action} #{test.title} question"
  end
end
