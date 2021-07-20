class BadgeIssuingService
  def self.call(test_taker)
    new(test_taker).issue_badge
  end

  def initialize(test_taker)
    @test_taker = test_taker
  end

  def issue_badge
    Badge.find_each do |badge|
      @test_taker.user.badges.push(badge) if rule_satisfied?(badge)
    end
  end

  private

  def rule_satisfied?(badge)
    "Badges::#{badge.rule.camelcase}".constantize.new(@test_taker, badge).satisfied?
  end
end
