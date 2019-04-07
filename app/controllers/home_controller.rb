class HomeController < ApplicationController

	def top
		@tags = Tag.find(TripTag.group(:tag_id).order('count(tag_id) desc').limit(20).pluck(:tag_id))
	    @new_trips = Trip.where(checking_finish: 1).limit(19).order(updated_at: :desc)
	end

	def about
		@user = User.first
	end

end
