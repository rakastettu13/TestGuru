class AddSuccessfullyToTestTakers < ActiveRecord::Migration[6.1]
  def change
    add_column :test_takers, :successfully, :boolean
  end
end
