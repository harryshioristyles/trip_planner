class UsersController < ApplicationController

  def top
  end

  def show
  	    @user = User.find(current_user.id)
  end

  def edit
	  	@user = User.find(current_user.id)
  end

  def update
  end
end
