class Tag < ApplicationRecord

	validates :tag, presence:true, length:{maximum:50}

    has_many :trips, through: :trip_tags
    has_many :trip_tags, dependent: :destroy

end
