module BootstrapForm::Components::Validation
  def get_error_messages(name)
    object.errors.full_messages_for(name).join(', ')
  end
end
