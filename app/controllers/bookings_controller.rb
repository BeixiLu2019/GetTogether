class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_activity, only: [:new, :create]

def new
  @booking = Booking.new
  create
  authorize @booking
end

def create
  @booking = Booking.new()
  @booking.activity_id = params[:activity_id]
  @booking.user_id = current_user.id
  authorize @booking
  if @booking.save
    redirect_to dashboard_path(params[:current_user])
    # render :show
    # redirect_to activity_path(params[:activity_id])
  else
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
    redirect_to dashboard_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:activity_id, :user_id)
  end
end
