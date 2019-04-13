class TripsController < ApplicationController

  before_action :authenticate_user!, except: [:search, :favorite_trips, :index_tag, :show]

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

  def index_tag
      @tag = Tag.find(params[:id])
      @trips = @tag.trips.order(updated_at: :desc)
  end

  def new
      @trip = Trip.new
  end

  def create
      @trip = current_user.trips.build(trip_params)
      @trip.checking_finish = 0
      tag_list = params[:tag_list].split(",")
    if @trip.save
      @trip.save_tags(tag_list)
      flash[:notice] = "Successfully created!!"
      redirect_to new_list_path(trip_id: @trip)
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
      @tag_list = @trip.tags.pluck(:tag).join(",")
  end

  def update
      @trip = Trip.find(params[:id])
      tag_list = params[:tag_list].split(",")
    if @trip.update_attributes(trip_params)
      @trip.save_tags(tag_list)
      flash[:notice] = "Successfully updated!!"
      redirect_to new_list_path(trip_id: @trip.id)
    else
      flash[:notice] = "Update error!!"
      redirect_to edit_trip_path(@trip)
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
