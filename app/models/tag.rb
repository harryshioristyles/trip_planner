class Tag < ApplicationRecord

	validates :tag, presence:true, length:{maximum:50}

    has_many :trip_tags, dependent: :destroy
    has_many :trips, through: :trip_tags

end