class ListsController < ApplicationController
  def index
  end

  def new
        @trip = Trip.find_by(id: params[:trip_id])
        @list = List.new
  end

  def create
        list = List.new(list_params)
        list.save!
        redirect_to new_list_path(trip_id: list.trip_id)
  end

  def show
  end

  def edit
        @list = List.find(params[:id])
  end

  def update
        list = List.find(params[:id])
      if
        list.update(list_params)
        redirect_to new_list_path(trip_id: list.trip_id)
        flash[:notice] = "successfully updated."
      else
        redirect_to edit_list_path(list.id)
        flash[:notice] = "update error!!"
      end
  end

  def destroy
        list = List.find(params[:id])
        if
           list.destroy
           flash[:notice] = 'successfully destroyed.'
        else
           flash[:notice] = 'destroy error!!'
        end
           redirect_to new_list_path
  end

private

  def list_params
        params.require(:list).permit(:list_title, :list_details, :day_index, :date, :begin, :end, :city_id, :activity_id, :trip_id)
  end

end
