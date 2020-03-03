class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :email, :bio, :birthday, :interest])

    # For additional in app/views/devise/registrations/edit.html.erb

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email, :bio, :birthday, :interest])

  end

  # Redirection after sign up  !!!
  # def after_sign_up_path_for(resource)
  #   edit_user_registration_path # <- Path you want to redirect the user to.
  # end
end
