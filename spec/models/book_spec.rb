require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it '正常に保存できる' do
    @book = FactoryBot.build(:book, user_id: @user.id)
    expect(@book).to be_valid
  end

  it 'titleは空にできない' do
    @book = FactoryBot.build(:book, title: '',user_id: @user.id)
    @book.valid?
    expect(@book.errors.messages[:title]).to include("can't be blank")
  end

  it 'bodyは空にできない' do
    @book = FactoryBot.build(:book, body: '',user_id: @user.id)
    @book.valid?
    expect(@book.errors.messages[:body]).to include("can't be blank")
  end
end