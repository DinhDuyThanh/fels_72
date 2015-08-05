class Admin::WordsController < ApplicationController
  require "csv"
  require "rails/all"
  before_action :verify_admin?
  
  def index
    @word = Word.all
  end
  
  def create
    begin
      Word.import params[:file]
      redirect_to admin_words_url, notice: t("import_CSV_success_mess")
    rescue
      redirect_to root_url, notice: t("import_CSV_warning_mess")
    end
  end
end
