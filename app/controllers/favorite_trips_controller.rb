class FavoriteTripsController < ApplicationController

  before_action :authenticate_user!

	def create
		trip = Trip.find(params[:trip_id])
		favorite = current_user.favorite_trips.new(trip_id: trip.id)
		favorite.save
		redirect_to user_path(current_user)
	end

    def destroy
		trip = Trip.find(params[:trip_id])
		favorite = current_user.favorite_trips.find_by(trip_id: trip.id)
		favorite.destroy
		redirect_to user_path(current_user)
    end
end