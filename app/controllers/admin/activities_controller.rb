class Admin::ActivitiesController < ApplicationController
  def index
      @activity = Activity.new
      @activities = Activity.all
  end

  def create
      activity = Activity.new(activity_params)
    if
      activity.save
      flash[:notice] = "created successfully!"
      redirect_to admin_activities_path
    else
      flash[:notice] = "Error"
      render action: :index
    end
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
    if
      activity.update(activity_params)
      redirect_to admin_activity_path(activity)
      flash[:notice] = "successfully updated"
    else
      redirect_to edit_admin_path(activity)
      flash[:notice] = 'update error!!'
    end

  end

  def destroy
      activity = Activity.find(params[:id])
    if
      activity.destroy
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