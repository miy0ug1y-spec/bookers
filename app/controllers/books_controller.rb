class BooksController < ApplicationController
  def index
    @books = Book.all
    @books =Book.new
  end

  def create
    @books = Book.new(book_params)
    if @books.save
    redirect_to '/books/:id/edit'
    else
    render :index, status: :unprocessable_entity
    end
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
   
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
