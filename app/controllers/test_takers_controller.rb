class TestTakersController < ApplicationController
  before_action :set_test_taker, only: %i[show result update]

  def show; end

  def result; end

  def update
    @test_taker.accept!(params[:answer_ids])

    if @test_taker.out_of_time?
      redirect_to result_test_taker_path(@test_taker), notice: t('.out_of_time')
    elsif @test_taker.completed?
      BadgeIssuingService.call(@test_taker)
      redirect_to result_test_taker_path(@test_taker)
    else
      render :show
    end
  end

  private

  def set_test_taker
    @test_taker = TestTaker.find(params[:id])
  end
end
