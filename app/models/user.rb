class User < ApplicationRecord
  def tests(level)
    test_ids = TestTaker.where(user_id: id).select(:test_id)
    Test.where(id: test_ids, level: level)
  end
end
