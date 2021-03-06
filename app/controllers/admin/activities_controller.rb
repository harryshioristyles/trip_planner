class Admin::ActivitiesController < ApplicationController

  before_action :authenticate_admin!

  def index
      @activity = Activity.new
      @activities = Activity.all
      @cities = City.all
      @countries = Country.order(:area)
  end

  def create
      activity = Activity.new(activity_params)
      activity.save ? flash[:notice] = "created successfully!" : flash[:notice] = "Error"
      redirect_to admin_activities_path
  end

  def show
      @activity = Activity.find(params[:id])
  end

  def edit
      @activity = Activity.find(params[:id])
      @activities = Activity.all
  end

  def update
      activity = Activity.find(params[:id])
    if activity.update(activity_params)
      redirect_to admin_activity_path(activity)
      flash[:notice] = "successfully updated"
    else
      redirect_to edit_admin_path(activity)
      flash[:notice] = 'update error!!'
    end
  end

  def destroy
      activity = Activity.find(params[:id])
    if activity.destroy
      redirect_to admin_activities_path
      flash[:notice] = "successfully updated"
    else
      redirect_to admin_activity_path(activity)
      flash[:notice] = 'destroy error!!'
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:activity_name, :description, :city_id, :activity_image)
  end
end