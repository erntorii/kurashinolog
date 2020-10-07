class Users::SessionsController < Devise::SessionsController
  # ゲストユーザーログイン
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path
  end
end
