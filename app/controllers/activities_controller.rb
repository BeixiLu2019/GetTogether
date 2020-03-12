class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :destroy]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @current_page = "activities"
    if params[:address] && params[:address].empty?
        @user_location = params[:search].present? ?  params[:search][:current_location] : params[:current_location]
        if params[:category].present?
          @activities = policy_scope(Activity).where(category: params[:category]).geocoded.near(@user_location, 5).sort_by{|activity| activity.datetime}
        else
          @activities = policy_scope(Activity).geocoded.near(@user_location, 5).sort_by{|activity| activity.datetime}
        end
    elsif params[:address].present?
      @activities = policy_scope(Activity).geocoded.near(params[:address], 5)
      @activities = @activities.where(category: params[:category]) unless params[:category].nil? || params[:category].empty?
      @activities = @activities.sort_by{|activity| activity.datetime}
    elsif params[:category].present?
      @activities = policy_scope(Activity).where(category: params[:category]).sort_by{|activity| activity.datetime}
    else
      @activities = policy_scope(Activity).geocoded.sort_by{|activity| activity.datetime} #returns activitys with coordinates
    end
    @user_location = params[:search].present? ?  params[:search][:current_location] : params[:current_location]
    @explore_activity = Activity.joins(:bookings).group('activities.id').having('COUNT(bookings.id) < activities.capacity').where('activities.datetime > CURRENT_TIMESTAMP').sample
  end

  def show
    # authorize @office
    @activity = Activity.find(params[:id])
    @booking = Booking.new
    # authorize @booking
    @marker = {
      lat: @activity.latitude,
      lng: @activity.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { activity: @activity }),
      image_url: helpers.asset_url('smile-regular')
    }
  end

  def new
    @current_page = "new activity"
    @user = current_user
    @activity = Activity.new
    authorize @activity
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
    authorize @activity
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
