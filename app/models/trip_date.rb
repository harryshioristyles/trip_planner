class TripDate < ApplicationRecord
    belongs_to :trip
    has_many :lists, dependent: :destroy
end
