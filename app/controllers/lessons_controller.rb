class LessonsController < ApplicationController
  def index
    @lessons = Lesson.paginate page: params[:page], per_page: 10
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def create
    
  end

  def update
    @result = 0
    lesson_params[:words_attributes].each do |k,v|
      show_answer_attributes(k).each do |k1,v1|
        @result += 1 if is_true?(v1[:correct])
      end
    end
    @lesson = Lesson.find params[:id]
    @lesson.result = @result
    if @lesson.update_attributes lesson_params
      redirect_to :back, :params => @params
    end
  end

  private 
  def is_true?(string)
    ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include?(string)
  end

  def lesson_params
    params.required(:lesson).permit(:id, :words_attributes => [:id] )
  end

  def show_answer_attributes word_id
    params[:lesson][:words_attributes][word_id][:answers_attributes]
  end
end 
