class UsersController < ApplicationController

  def top
  end

  def show
  	        @user = User.find(current_user.id)
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
      params.require(:user).permit(:nickname, :introduce, :user_image)
    end

end
