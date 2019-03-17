class TripsController < ApplicationController
  def index
        @trips = Trip.where(user_id: current_user)
        @search_trips = Trip.search(params[:search])
  end

  def tag
        @trips = Tag.find(params[:id]).trips
  end

  def new
    @trip = Trip.new
  end

  def create
        trip = current_user.trips.build(trip_params)
        trip.checking_finish = 0
        tag_list = params[:tag_list].split(",")
        if
          trip.save!
          trip.save_tags(tag_list)
          flash[:notice] = "successfully created."
          redirect_to new_list_path(trip_id: trip)
        else
          render 'new'
        end
  end

  def show
        @trip = Trip.find(params[:id])
  end

  def result
        @trip = Trip.find(params[:id])
        @trip.update(checking_finish: 1)
        @days = List.where(trip_id: @trip).maximum(:day_index)
  end

  def edit
        @trip = Trip.find(params[:id])
        @tag_list = @trip.tags.pluck(:tag).join(",")
  end

  def update
        trip = Trip.find(params[:id])
        tag_list = params[:tag_list].split(",")
      if
        trip.update_attributes(trip_params)
        trip.save_tags(tag_list)
        flash[:notice] = "successfully updated."
        redirect_to new_list_path(trip_id: trip.id)
      else
        flash[:notice] = "update error!!"
        redirect_to edit_trip_path(trip.id)
      end
  end

  def destroy
        trip = Trip.find(params[:id])
        if
           trip.destroy
           flash[:notice] = 'successfully destroyed.'
        else
           flash[:notice] = 'destroy error!!'
        end
           redirect_to trips_path
  end

private

  def trip_params
        params.require(:trip).permit(:trip_title, :trip_details, :trip_image)
  end

end
