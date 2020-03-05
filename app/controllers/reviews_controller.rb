class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    if @booking.activity.datetime < DateTime.now()
      @review = Review.new
      authorize @review
    else
      flash[:alert] = "You can't create a review for this event yet!"
    end
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @review.booking = @booking
    # @review.user_id = current_user.id
    authorize @review
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    # @booking = review.booking_id
    authorize @review
    # authorize @booking
  end

  def update
     @review = Review.find(params[:id])
     authorize @review
     if @review.update(review_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @review = Review.find(params[:id])
    @booking = review.booking_id
    @review.destroy
    authorize @review
    redirect_to dashboard_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :activity_rating)
  end

end
