class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
     # authorize @user
  end

  def update
    authorize @user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

 private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:bio, :username, :birthday, :interest, :email, :first_name, :last_name, :password, :photo )
  end
end

