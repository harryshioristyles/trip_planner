class Activity < ApplicationRecord

	belongs_to :city
    has_many :lists

end
