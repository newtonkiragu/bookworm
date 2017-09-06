class UsersController < ApplicationController
  def show
    add_reading
    @user = current_user
    @book = current_user.books
  end
end
