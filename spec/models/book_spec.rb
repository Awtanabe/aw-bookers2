require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @user = User.create(name: "user1", email: "email@aa.aa", password: 'password')
  end

  it '正常に保存できる' do
    @book = Book.new(title: "title", body: 'body', user_id: @user.id)
    expect(@book).to be_valid
  end

  it 'titleは空にできない' do
    @book = Book.new(title: "", body: 'body', user_id: @user.id)
    @book.valid?
    expect(@book.errors.messages[:title]).to include("can't be blank")
  end

  it 'bodyは空にできない' do
    @book = Book.new(title: "title", body: '', user_id: @user.id)
    @book.valid?
    expect(@book.errors.messages[:body]).to include("can't be blank")
  end
end