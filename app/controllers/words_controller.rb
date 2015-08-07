class WordsController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page], per_page: 5
    if !params[:category_id].nil?
      @category = Category.find params[:category_id]
      @words = @category.words
    end
  end
 
end
