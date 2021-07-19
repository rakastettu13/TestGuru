class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :description
      t.string :rule, null: false
      t.string :rule_value
      t.string :image_url, null: false

      t.index :title, unique: true

      t.timestamps
    end
  end
end
