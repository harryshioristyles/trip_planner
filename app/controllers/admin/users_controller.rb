class Admin::UsersController < ApplicationController
  def index
	  	@users = User.all
  end

  def edit
	  	@user = User.find(params[:id])
      @users = User.all
  end

  def update
  	  user = User.find(params[:id])
	  if
		  user.update(user_params)
		  redirect_to admin_users_path
		  flash[:notice] = "successfully updated"
	  else
	  	redirect_to edit_admin_user_path(user.id)
      flash[:notice] = 'update error!!'
    end
  end

  def destroy
      user = User.find(params[:id])
    if
      user.destroy
      redirect_to admin_users_path
      flash[:notice] = 'Book was successfully destroyed.'
    else
      redirect_to edit_admin_user_path(user.id)
      flash[:notice] = 'destroy error!!'
    end
  end

    private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :user_image)
  end

end