class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :words
  has_many :results
  has_many :answers
  accepts_nested_attributes_for :words
end
