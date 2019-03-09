class Admin::ActivitiesController < ApplicationController
  def index
          @activity = Activity.new
          @activities = Activity.all
  end

  def create
              activity = Activity.new(activity_params)
    if    activity.save
              flash[:notice] = "created successfully!"
              redirect_to admin_activities_path
    else
              flash[:notice] = "Error"
              render action: :index
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

      def activity_params
        params.require(:activity).permit(:activity_name, :description, :city_id)
      end
end
