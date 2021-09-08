class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @books = Book.new(book_params)
    if @books.save
      flash[:notice] = 'successfully'
      redirect_to index
    else
      flash.now[:alert] = 'error'
      render :index
    end
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    book = Blog.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'successfully'
      redirect_to book_path(book)
    else
      flash.now[:alert] = 'error'
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: 'successfully'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end