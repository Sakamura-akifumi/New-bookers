class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book was successfully created'
      redirect_to show
    else
      flash.now[:alert] = 'error prohibited this book from being saved'
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully update'
      redirect_to show
    else
      flash.now[:alert] = 'error prohibited this book from being saved'
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end