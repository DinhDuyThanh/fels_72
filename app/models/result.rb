class Result < ActiveRecord::Base
  belongs_to :lesson
  has_one :word
  belongs_to :answer
end
