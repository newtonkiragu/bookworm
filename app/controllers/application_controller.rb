class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ReadingList

protected

def configure_permitted_parameters
  added_attrs = [:name, :picture, :email, :password, :password_confirmation, :remember_me]
  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
end
  protect_from_forgery with: :exception
  def index
    @user = current_user
    @book = @user.books.all
  end
end
