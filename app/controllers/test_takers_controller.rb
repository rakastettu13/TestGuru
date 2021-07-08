class TestTakersController < ApplicationController
  before_action :set_test_taker, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_taker.accept!(params[:answer_ids])

    if @test_taker.completed?
      redirect_to result_test_taker_path(@test_taker)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_taker.current_question).call

    flash_options = if result[:success]
                      { notice: t('.success')}
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @test_taker, flash_options
  end

  private

  def set_test_taker
    @test_taker = TestTaker.find(params[:id])
  end
end
