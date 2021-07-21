class Badges::AllTestsFromTheCategory < Badges::Rules
  def initialize(_test_taker, badge)
    super
    @category_id = badge.rule_value
  end

  def satisfied?
    all_tests_by_category = Test.where(category_id: @category_id)
    passing_tests_by_category = @user.tests.where(category_id: @category_id).passed_after(badge_issue_time)

    (all_tests_by_category - passing_tests_by_category).empty?
  end
end
