class CreateBadgeOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_owners do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
