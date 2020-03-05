class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:edit, :update]
  # def after_sign_up_path_for(resource)
  #   edit_user_registration_path
  # end

  # def edit
  #    # authorize @user
  # end

  # def update
  #   authorize @user
  #   @user.update(user_params)
  #   redirect_to user_path(current_user)
  # end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:bio, :username, :birthday, :interest, :email, :first_name, :last_name, :password, :photo )
  end
end
