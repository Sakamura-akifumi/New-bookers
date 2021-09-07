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
      flash[:notice] = '投稿が完了しました'
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = '投稿が失敗しました'
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Blog.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = '変更が完了しました'
      redirect_to book_path(book)
    else
      flash.now[:alert] = '変更が失敗しました'
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: '削除しました'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
