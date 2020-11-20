class BooksController < ApplicationController
  before_action :set_book, only: %w[show edit]

  def index
    @books = Book.all
    @book = Book.new
  end

  def new
  end

  def create
    @book = Book.new(book_prams)
    if @book.save
      flash['success'] = 'Book is created'
    else
      flash['failed'] = 'Book is not created'
    end
    redirect_to homes_home_path
  end

  def show
  end

  def edit
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_prams)
      flash['success'] = 'Book is updated'
    else
      flash['failed'] = 'Book is not updated'
    end
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash['success'] = 'Book is deleted'
    else
      flash['failed'] = 'Book is not deleted'
    end
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_prams
    params.require(:book).permit(:title,:body).merge(user_id: current_user.id)
  end
end
