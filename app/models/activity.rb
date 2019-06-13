class Activity < ApplicationRecord

 	validates :activity_name, presence: true, length: { maximum: 50 }
	validates :description, length: { maximum: 100 }

	belongs_to :city
    has_many :lists
    has_one_attached :activity_image

end
