class UsersController < ApplicationController
  before_action :set_user, only: %w[show edit update]

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
    @book = Book.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash['success'] = 'User is Updated'
      redirect_to user_path(@user)
    else
      flash['failed'] = 'User is not Updated'
      redirect_to user_path(@user)
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
