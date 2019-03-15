class FavoriteTripsController < ApplicationController
        def create
            trip = Trip.find(params[:trip_id])
            favorite = current_user.favorite_trips.new(trip_id: trip.id)
            favorite.save
            redirect_to trips_path
        end
        def destroy
            trip = Trip.find(params[:trip_id])
            favorite = current_user.favorite_trips.find_by(trip_id: trip.id)
            favorite.destroy
            redirect_to trips_path
        end
end
