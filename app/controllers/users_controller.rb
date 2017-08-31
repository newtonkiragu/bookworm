class UsersController < ApplicationController
  def show
    @user = current_user
    @book = current_user.books

  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
