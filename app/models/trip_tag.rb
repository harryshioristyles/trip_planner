class TripTag < ApplicationRecord

	validates :trip_id, presence:true
	validates :tag_id, presence:true

	belongs_to :trip
	belongs_to :tag

end
