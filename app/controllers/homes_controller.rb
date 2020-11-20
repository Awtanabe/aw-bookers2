class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:home]
  def top
  end

  def home
    @book = Book.new
  end

  def about
  end
end
