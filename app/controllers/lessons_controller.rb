class LessonsController < ApplicationController
  def index
    @lessons = Lesson.paginate page: params[:page], per_page: 10
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def create
    @lesson = Lesson.find params[:id]
    @result = 0
    @lesson.words.each do |word|
      @result += 1 if is_true?(params[word.id.to_s])   
    end
  end

  private 
  def is_true?(string)
    ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include?(string)
  end
end 
