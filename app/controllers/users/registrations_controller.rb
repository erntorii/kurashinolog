class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]

  def destroy_image
    current_user.image.destroy
    redirect_to edit_user_registration_path
  end

  protected

  # ユーザー編集時のパスワード入力を省略する
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(_resource)
    edit_user_registration_path
  end
end
