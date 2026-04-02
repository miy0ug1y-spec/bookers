class BooksController < ApplicationController
  def index
    @book =Book.new
    @books = Book.all.order(created_at: :asc)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
    @books = Book.all.order(created_at: :desc)
    render :index, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully Updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all.order(created_at: :asc)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
     book = Book.find(params[:id])
     book.destroy
     flash[:notice] = "Book was successfully destroyed."
     redirect_to '/books'
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
