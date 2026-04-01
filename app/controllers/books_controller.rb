class BooksController < ApplicationController
  def index
    @book =Book.new
    @books = Book.all.order(created_at: :desc)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to '/books/:id/edit'
    else
    @books = Book.all.order(created_at: :desc)
    render :index, status: :unprocessable_entity
    end
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
   @book = Book.find(params[:id])
   
  end

  def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to '/'
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
