class BooksController < ApplicationController
  def index
    @books = Book.all
    @books =Book.new
  end

  def create
    book = Book.new(list_params)
    book.save
    redirect_to '/'
  end

  def show
    
  end

  def edit

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
