class TestsController < ApplicationController
  before_action :find_test, only: %i[show start]
  before_action :find_user, only: :start

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_taker(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = current_user
  end
end
