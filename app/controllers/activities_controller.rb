class ActivitiesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_activity, only: [:show, :edit, :update, :destroy]

def index
  @activities = Activity.all
end

def show
    # authorize @office
    @activity = Activity.find(params[:id])
    # authorize @booking

  end

  def new
    @user = current_user
    @activity = Activity.new
    # authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    # authorize @office
    @activity.save
    redirect_to activity_path(@activity)
  end

  # def edit
  #   authorize @activiy
  # end

  # def update
  #   authorize @activiy
  #   @activiy.update(activiy_params)
  #   redirect_to activiy_path(@activiy)
  # end

  # def destroy
  #   authorize @activiy
  #   @activiy.destroy
  #   redirect_to activiys_path
  # end

private

  def set_activity
    @activity = Activity.find(params[:id])
    # for when we install Pundit :
    # authorize @office
  end

  def activity_params
    params.require(:activity).permit(:datetime, :name, :capacity, :address, :description, :category, :user_id, photos: [])
  end


end
