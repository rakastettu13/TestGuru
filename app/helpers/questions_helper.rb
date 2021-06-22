module QuestionsHelper
  def question_header(test)
    action = if params[:action] == 'new'
               'Create new'
             else
               params[:action].capitalize
             end
    "#{action} #{test.title} question"
  end
end
