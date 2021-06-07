class User < ApplicationRecord
  def tests(level)
    Test.joins('JOIN test_takers ON test_id = tests.id').where('level = ? AND test_takers.user_id = ?', level, id)
  end
end
