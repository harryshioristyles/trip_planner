class FavoriteTrip < ApplicationRecord

	validates :user_id, numericality: { only_integer: true }
	validates :trip_id, numericality: { only_integer: true }

	belongs_to :user
	belongs_to :trip

end