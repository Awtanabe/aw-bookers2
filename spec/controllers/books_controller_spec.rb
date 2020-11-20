require'rails_helper'
RSpec.describe BooksController, type: :request do
  before do
    @user = User.create(name: "user1", email: "email@aa.aa", password: 'password')
    @book = Book.create(title: 'title', body: 'body',user_id: @user.id)
    sign_in @user
  end

  it '#index' do
    get books_path
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end

  it '#new' do
    get new_book_path
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end

  it '#edit' do
    @book = Book
    get new_book_path
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end

  it '#create' do
    book_params = {title: "title1", body: "body1", user_id: @user.id}
    expect {
      post books_path, params: { book: book_params }
    }.to change(@user.books, :count).by(1) 
  end

  it '#update' do
    book_params = {title: "updated"}
    expect {
      put book_path @book, params: { id: @book.id, book: book_params } 
    }.to change{@book.reload.title}.from('title').to('updated') 
  end

  it '#delete' do
    expect {
      delete book_path @book, params: { id: @book.id } 
    }.to  change(@user.books, :count).by(-1) 
  end
end