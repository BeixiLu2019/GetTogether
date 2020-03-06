class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
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
    # @sorted_hosting = @sorted_upcoming.select{|activity| activity.user_id == current_user.id}
    @sorted_past = past_activities.sort_by{|activity| activity.datetime }
    @sorted_hosting = past_activities.concat(upcoming_activities).select{|activity| activity.user_id == current_user.id}.sort_by{|activity| activity.datetime }
    @reviews = Review.all
  end
end
