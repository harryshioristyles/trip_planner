class City < ApplicationRecord

 	validates :city_name, presence: true, length: { maximum: 85 }
	validates :country_id, numericality: { only_integer: true }

	belongs_to :country

    has_many :activities, dependent: :destroy
    has_many :lists

end