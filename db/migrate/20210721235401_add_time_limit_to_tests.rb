class AddTimeLimitToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_limit, :integer
  end
end
