class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @user = current_user
    @book = @user.books.all
    @books = Book.all
  end
end
