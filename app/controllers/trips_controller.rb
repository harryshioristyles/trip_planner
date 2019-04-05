class TripsController < ApplicationController

  before_action :authenticate_user!, except: [:search]

  def page(all_trips)
      page_no = params[:id].to_i
      trips = all_trips[page_no*10..page_no*10+9]
      previous_page = page_no - 1
    if all_trips.last == trips.last
      next_page = 0
    else
      next_page = page_no + 1
    end
    return trips,next_page,previous_page
  end

  def search
      all_trips = Trip.search(params[:search]).where(checking_finish: 1).order(updated_at: :desc)

      @trips,@next_page,@previous_page = page(all_trips)
  end

  def favorite_trips
      @user = User.find(params[:user_id])
      all_trips = FavoriteTrip.where(user_id: @user.id).order(created_at: :desc).map{|a| a.trip}

      @trips,@next_page,@previous_page = page(all_trips)
  end

  def new
      @trip = Trip.new
  end

  def create
      trip = Trip.new(trip_params)
      trip.checking_finish = 0
      trip.user_id = current_user.id
    if trip.save
      flash[:notice] = "Successfully created!!"
      redirect_to new_list_path(trip_id: trip)
    else
      flash[:notice] = "Created error!!"
      redirect_to new_trip_path
    end
  end

  def show
      @trip = Trip.find(params[:id])
      @days = List.where(trip_id: @trip).maximum(:day_index)
      @user = User.find(@trip.user_id)
  end

  def result
      @trip = Trip.find(params[:id])
      @trip.update(checking_finish: 1)
      flash[:notice] = "Successfully saved!! Have a nice trip!!"
      redirect_to trip_path(@trip)
  end

  def edit
      @trip = Trip.find(params[:id])
      @days = List.where(trip_id: @trip).maximum(:day_index)
  end

  def update
      trip = Trip.find(params[:id])
    if trip.update(trip_params)
      redirect_to new_list_path(trip_id: trip.id)
      flash[:notice] = "Successfully updated."
    else
      redirect_to edit_trip_path(trip.id)
      flash[:notice] = "Update error!!"
    end
  end

  def destroy
      trip = Trip.find(params[:id])
      trip.destroy ? flash[:notice] = 'Successfully destroyed.' : flash[:notice] = 'Destroy error!!'
      redirect_to user_path(trip.user_id)
  end

private

  def trip_params
      params.require(:trip).permit(:trip_title, :trip_details, :trip_image)
  end

end
