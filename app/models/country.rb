class Country < ApplicationRecord

 	validates :country_name, presence: true, length: { maximum: 50 }

	has_many :cities, inverse_of: :country, dependent: :destroy
	accepts_nested_attributes_for :cities, reject_if: :all_blank, allow_destroy: true

	has_many :activities, through: :cities

 	enum area: {asia: 0, middle_east: 1, europe: 2, africa: 3, north_america: 4, south_america: 5, oceania: 6}

end