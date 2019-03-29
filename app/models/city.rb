class City < ApplicationRecord

 	validates :city_name, presence: true, length: { maximum: 85 }

	belongs_to :country

    has_many :activities, dependent: :destroy
    has_many :lists

end