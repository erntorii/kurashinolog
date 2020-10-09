class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]

  def destroy_image
    current_user.image.destroy
    redirect_to edit_user_registration_path
  end

  protected

  def after_update_path_for(_resource)
    edit_user_registration_path
  end
end
