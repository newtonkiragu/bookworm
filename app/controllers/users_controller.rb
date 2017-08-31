class UsersController < ApplicationController
  def show
    @user = current_user
    @book = current_user.books
    @books = Book.all
  end
end
