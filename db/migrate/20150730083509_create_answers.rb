class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :correct
      t.integer :word_id

      t.timestamps null: false
    end
  end
end
