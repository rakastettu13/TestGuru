class Badges::TestOnFirstAttempt < Badges::Rules
  def initialize(test_taker, badge)
    super
    @test_id = badge.rule_value.to_i
  end

  def satisfied?
    return false unless @test_taker.successfully && @test_taker.test_id == @test_id

    TestTaker.where(user: @user, test_id: @test_id).count == 1
  end
end
