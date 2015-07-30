class Word < ActiveRecord::Base
  belongs_to :category
  belongs_to :lesson
  
  has_many :results
  has_many :answers
end
