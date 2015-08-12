class Word < ActiveRecord::Base
  belongs_to :category
  belongs_to :lesson
  has_one :result

  has_many :answers

  require "csv"

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      hash = row.to_hash
      @word = Word.create content: hash["Word"]
      @word.answers.create content: hash["Answer1"], correct: hash["Correct1"]
      @word.answers.create content: hash["Answer2"], correct: hash["Correct2"]
      @word.answers.create content: hash["Answer3"], correct: hash["Correct3"]
      @word.answers.create content: hash["Answer4"], correct: hash["Correct4"]
    end 
  end 
end
