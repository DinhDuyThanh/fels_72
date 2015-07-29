class Lesson < ActiveRecord::Base
  belongs_to :category
  has_many :words, dependent: :destroy
  has_many :results, dependent: :destroy
end
