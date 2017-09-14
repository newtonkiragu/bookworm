class UsersController < ApplicationController
  before_action :set_user, only: [:author]

  def show
    add_reading
    @user = current_user
    @book = current_user.books
  end

  def author
    @book.user_id = @book.author
    @user = @author
    @books = @author.books
  end

  private
  def set_user
    @author = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id)
  end

end
