class WordsController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page], per_page: 5
   end
   def create
    @category = Category.find(params[:category_id])
    @words = @category.words
   end
end
