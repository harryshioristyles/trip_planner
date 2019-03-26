class UsersController < ApplicationController

  def top
      @new_trips = Trip.where(checking_finish: 1).limit(7).order(updated_at: :desc)
      @favorites = FavoriteTrip.where(user_id: current_user.id).order(created_at: :desc).map{|a| a.trip}
  end

  def show
      @user = User.find(params[:id])
      @trips = Trip.where(user_id: @user, checking_finish: 1)
  end

  def edit
	    @user = User.find(params[:id])
  end

  def update
      user = User.find(params[:id])
	  if
	  	user.update(user_params)
	  	redirect_to user_path(user.id)
	  	flash[:notice] = "successfully updated"
	  else
	  	redirect_to edit_user_path(user.id)
      flash[:notice] = 'update error!!'
    end
  end

    private

    def user_params
      params.require(:user).permit(:nickname, :introduction, :user_image)
    end

end
