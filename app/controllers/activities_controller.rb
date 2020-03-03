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

  def edit
    #authorize @activity
  end

  def update
    #authorize @activity
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    #authorize @activity
    @activity.destroy
    redirect_to activities_path # to be updated
  end

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
