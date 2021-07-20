class Badges::Rules
  def initialize(test_taker, badge)
    @user = test_taker.user
    @test_taker = test_taker
    @badge = badge
  end

  def badge_issue_time
    @user.badge_owners.where(badge: @badge).last&.updated_at || Time.current - 5.years
  end
end
