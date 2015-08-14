class Result < ActiveRecord::Base
  belongs_to :lesson
  has_one :word
  has_one :answer
end
