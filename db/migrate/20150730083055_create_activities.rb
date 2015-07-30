class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :description
      t.integer :user_id
      t.integer :target_id
      t.string :type

      t.timestamps null: false
    end
  end
end
