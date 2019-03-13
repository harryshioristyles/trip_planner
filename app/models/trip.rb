class Trip < ApplicationRecord

	belongs_to :user
    has_many :lists, dependent: :destroy, -> {order(:day_index, :begin)}

  enum checking_finish: {not_finish: 0, finished: 1}

end
