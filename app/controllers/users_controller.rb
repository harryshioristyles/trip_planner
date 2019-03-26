class UsersController < ApplicationController

  def top
      @new_trips = Trip.where(checking_finish: 1).limit(7).order(updated_at: :desc)
      @favorites = FavoriteTrip.where(user_id: current_user.id).order(created_at: :desc).map{|a| a.trip}
  end

  def plan
      @user = User.find(params[:user_id])
      all_trips = Trip.where(user_id: @user, checking_finish: 1).order(created_at: :desc)

      page_no = params[:id].to_i
      @trips = all_trips[page_no*10..page_no*10+9]
      @next_page = page_no + 1
      @previous_page = page_no - 1
  end

  def show
      @user = User.find(params[:id])
      # @trips = Trip.where(user_id: @user, checking_finish: 1)
      @trips = Trip.all
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
