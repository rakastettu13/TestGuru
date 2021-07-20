class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def issued
    @badges = current_user.badges
  end
end
