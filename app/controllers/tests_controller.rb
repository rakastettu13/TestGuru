class TestsController < ApplicationController
  before_action :find_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_taker(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
