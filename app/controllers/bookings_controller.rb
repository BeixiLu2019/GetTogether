class BookingsController < ApplicationController
  before_action :set_activity, only: [:new, :edit, :create]

def new
  @booking = Booking.new
  # authorize @booking
end

def create
  @booking = Booking.new(booking_params)
  @booking.activity_id = @activity.id
  @booking.user_id = current_user.id
  # authorize @booking
  @booking.save
  redirect_to booking_path(@booking)
  # else
  #   render :new
  # end
end

  def show #confirmation page
    @booking = Booking.find(params[:id])
    # authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @office = @booking.office_id
    @booking.destroy
    authorize @booking
    redirect_to offices_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:activity_id, :user_id)
  end
end
