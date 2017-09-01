class UsersController < ApplicationController
  def show
    @user = current_user
    @book = current_user.books
  end
end
