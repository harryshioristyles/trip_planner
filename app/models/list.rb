class List < ApplicationRecord

 	validates :list_title,   presence: true, length: { in: 2..20 }
 	validates :list_details, length: { maximum: 200 }
	validates :day_index,    numericality: { only_integer: true }
	validates :city_id,      numericality: { only_integer: true }
	validates :activity_id,  numericality: { only_integer: true }
	validates :trip_id,      numericality: { only_integer: true }

	belongs_to :city
	belongs_to :activity
    belongs_to :trip

end