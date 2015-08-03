class WordsController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page], per_page: 5
    @word = Word.new
   end
   def create
    @category = Category.find(params[:word][:category])
    @words = @category.words
   end
end
