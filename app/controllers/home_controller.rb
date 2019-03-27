class HomeController < ApplicationController

	def top
	    @new_trips = Trip.where(checking_finish: 1).limit(21).order(updated_at: :desc)
	end

end
