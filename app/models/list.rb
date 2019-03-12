class List < ApplicationRecord

	belongs_to :city
	belongs_to :activity
    belongs_to :trip

end
