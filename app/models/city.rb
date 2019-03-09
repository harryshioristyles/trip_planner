class City < ApplicationRecord

	belongs_to :country

    has_many :activities, dependent: :destroy


end
