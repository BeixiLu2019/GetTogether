class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_activity, only: [:new, :create]

def new
  @booking = Booking.new
  authorize @booking
end

def create
  @booking = Booking.new()
  @booking.activity_id = params[:activity_id]
  @booking.user_id = current_user.id
  authorize @booking
  if @booking.save
    redirect_to activity_path(params[:activity_id])
  else
    # flash[:alert] = "No more spaces left!"
    render "activities/show", booking: @booking
    #redirect_to activity_path(@activity)
  end
end

  def show #confirmation page
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @activity = @booking.activity_id
    @booking.destroy
    authorize @booking
    redirect_to activities_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:activity_id, :user_id)
  end
end
