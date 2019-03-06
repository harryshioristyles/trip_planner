class Country < ApplicationRecord

	has_many :cities, dependent: :destroy

  enum area: {asia: 0, middle_east: 1, europe: 2, africa: 3, north_america: 4, south_america: 5, oceania: 6}

end
