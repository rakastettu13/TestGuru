class Badges::AllTestsOfTheLevel < Badges::Rules
  def initialize(_test_taker, badge)
    super
    @level = badge.rule_value
  end

  def satisfied?
    all_tests_by_level = Test.where(level: @level)
    passing_tests_by_level = @user.tests.where(level: @level).passed_after(badge_issue_time)

    (all_tests_by_level - passing_tests_by_level).empty?
  end
end
