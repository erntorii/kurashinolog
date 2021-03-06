class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ゲストユーザーの場合にリダイレクトする
  def check_guest
    email = resource&.email || params[:user][:email].downcase
    return unless email == 'guest@example.com'

    if user_signed_in?
      redirect_to edit_user_registration_path, alert: 'ゲストユーザーの変更・削除はできません。'
    else
      redirect_to new_user_session_path, alert: 'ゲストユーザーの変更はできません。'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile image])
  end
end
