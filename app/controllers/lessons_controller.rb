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
      @result_tmp = Result.find_by_word_id(word.id)
      if @result_tmp.nil?
        Result.create! word_id: word.id, category_id: word.category_id, 
          lesson_id: word.lesson_id, answer_id: params[word.id.to_s].to_i
      else
        @result_tmp.answer_id = params[word.id.to_s].to_i
        @result_tmp.save
      end  
      @result += 1 if params[word.id.to_s] == params["answer_id"+word.id.to_s] 
    end
    @lesson.result = @result
    @lesson.save
    redirect_to :back, :params => @params
  end

  private 
  def is_true?(string)
    ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include?(string)
  end
end 
