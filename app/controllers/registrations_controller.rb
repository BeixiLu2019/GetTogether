class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:edit, :update]
  
  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:bio, :username, :birthday, :interest, :email, :first_name, :last_name, :password, :photo )
  end
end
