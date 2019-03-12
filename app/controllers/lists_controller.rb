class ListsController < ApplicationController
  def index
  end

  def create
  end

  def new
        @trip = Trip.where(user_id: current_user.id).last
        @list = List.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
