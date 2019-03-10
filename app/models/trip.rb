class Trip < ApplicationRecord
	belongs_to :user
	has_many :trip_dates, dependent: :destroy

  enum check_finish: {not_finish: 0, finished: 1}

end
