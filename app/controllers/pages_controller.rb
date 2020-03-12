class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :random]

  def home
    @current_page = "home"
  end

  def dashboard
    @current_page = "dashboard"
    upcoming_activities = []
    past_activities = []
    current_user.bookings.each do |booking|
      if booking.activity.datetime > DateTime.now()
        upcoming_activities.push(booking.activity)
      else
        past_activities.push(booking.activity)
      end
    end
    current_user.activities.each do |activity|
      if activity.datetime > DateTime.now()
        upcoming_activities.push(activity)
      else
        past_activities.push(activity)
      end
    end
    @sorted_upcoming = upcoming_activities.sort_by{|activity| activity.datetime }
    @sorted_past = past_activities.sort_by{|activity| activity.datetime }
    @sorted_hosting = past_activities.concat(upcoming_activities).select{|activity| activity.user_id == current_user.id}.sort_by{|activity| activity.datetime }
    @reviews = Review.all
  end

  def random
    @user_location = params[:search].present? ?  params[:search][:current_location] : params[:current_location]
    activity_after_now = Activity.where('activities.datetime > CURRENT_TIMESTAMP')
    act = activity_after_now.select do |activity|
      activity.bookings.size < activity.capacity
    end
    array = []
    act.each do |activity|
      if !activity.bookings.present? || activity.id != current_user.id
        array.push(activity)
      else
        activity.bookings.each do |booking|
          if booking.user_id != current_user.id
            array.push(Activity.find(booking.activity.id))
          end
        end
      end
    end
    @explore_activity = array.sample
  end
end
