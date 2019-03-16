class Activity < ApplicationRecord

	belongs_to :city
    has_many :lists
    has_one_attached :activity_image
end
