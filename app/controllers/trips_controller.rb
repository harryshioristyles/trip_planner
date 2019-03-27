class TripsController < ApplicationController

  before_action :authenticate_user!, except: [:search]

  def search
      all_trips = Trip.search(params[:search]).where(checking_finish: 1).order(updated_at: :desc)

      page_no = params[:id].to_i
      @trips = all_trips[page_no*10..page_no*10+9]
      @next_page = page_no + 1
      @previous_page = page_no - 1
  end

  def favorite_trips
      @user = User.find(params[:user_id])
      all_trips = FavoriteTrip.where(user_id: @user.id).order(created_at: :desc).map{|a| a.trip}

      page_no = params[:id].to_i
      @trips = all_trips[page_no*10..page_no*10+9]
      @next_page = page_no + 1
      @previous_page = page_no - 1
  end

  def index_tag
        @trips = Tag.find(params[:id]).trips
  end

  def new
      @trip = Trip.new
  end

  def create
      trip = Trip.new(trip_params)
      trip.user_id = current_user.id
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
      flash[:notice] = 'Successfully destroyed.'
    else
      flash[:notice] = 'Destroy error!!'
    end
      redirect_to trips_path
  end

private

  def trip_params
      params.require(:trip).permit(:trip_title, :trip_details, :trip_image)
  end

end
