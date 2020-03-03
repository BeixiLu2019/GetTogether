class ActivitiesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = policy_scope(Activity)
    # @activities = Activity.all
  end

  def new
    @user = current_user
    @activity = Activity.new
    authorize @activity
  end

  def show
    # authorize @booking
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    authorize @activity
    @activity.save
    redirect_to activity_path(@activity)
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
  end

private

  def set_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def activity_params
    params.require(:activity).permit(:datetime, :name, :capacity, :address, :description, :category, :user_id, photos: [])
  end

end
