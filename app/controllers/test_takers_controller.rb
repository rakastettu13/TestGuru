class TestTakersController < ApplicationController
  before_action :set_test_taker, only: %i[show result update]

  def show; end

  def result; end

  def update; end

  private

  def set_test_taker
    @test_taker = TestTaker.find(params[:id])
  end
end
