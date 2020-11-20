class BooksController < ApplicationController
  def index
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
  end

  def destroy
  end

  private

  def book_prams
    params.require(:book).permit(:title,:body).merge(user_id: current_user.id)
  end
end
