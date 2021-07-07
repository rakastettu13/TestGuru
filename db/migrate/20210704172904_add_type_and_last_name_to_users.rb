class AddTypeAndLastNameToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :type, null: false, default: 'User'
      t.string :last_name
    end
  end
end
