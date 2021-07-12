class GistsController < ApplicationController
  before_action :set_test_taker

  def create
    result = GistQuestionService.new(@test_taker.current_question).call

    flash_options = if result.success?
                      @test_taker.current_question.gists.create(user: current_user, url: result.url)
                      { notice: t('.success', url: result.url) }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @test_taker, flash_options
  end

  def set_test_taker
    @test_taker = TestTaker.find(params[:test_taker_id])
  end
end
