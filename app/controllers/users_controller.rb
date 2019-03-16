class UsersController < ApplicationController


  def top
  end

  def show
  	        @user = current_user
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

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
      @user  = User.find(params[:id])
      @users = @user.followers
      render 'show_follower'
  end

    private

    def user_params
      params.require(:user).permit(:nickname, :introduction, :user_image)
    end

end
