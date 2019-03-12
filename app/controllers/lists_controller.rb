class ListsController < ApplicationController
  def index
  end

  def new
        @trip = Trip.where(user_id: current_user.id).last
        @list = List.new
  end

  def create
        list = List.new(list_params)
        trip_id = Trip.where(user_id: current_user.id).last
        list.trip_id = trip_id.id
        list.save!
        redirect_to new_list_path
  end

  def show
  end

  def edit
        @list = List.find(params[:id])
  end

  def update
  end

  def destroy
  end

private

  def list_params
        params.require(:list).permit(:list_title, :list_details, :day_index, :date, :begin, :end, :city_id, :activity_id)
  end

end
