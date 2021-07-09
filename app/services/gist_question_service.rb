class GistQuestionService
  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: github_access_token)
  end

  def call
    gist = @client.create_gist(gist_params)
    { success: success?, url: gist.html_url }
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: I18n.t('description', title: @test.title),
      files: {
        I18n.t('file') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def github_access_token
    Rails.application.credentials.github_access_token
  end
end
