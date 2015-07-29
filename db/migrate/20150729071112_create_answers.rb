class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.boolean :true
      t.integer :word_id

      t.timestamps null: false
    end
  end
end
