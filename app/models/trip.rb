class Trip < ApplicationRecord

	belongs_to :user
    has_many :lists, dependent: :destroy, -> {order(:day_index, :begin)}
    has_one_attached :trip_image

  enum checking_finish: {not_finish: 0, finished: 1}

    def self.search(search)
      if search
        Trip.where(['trip_title LIKE ?', "%#{search}%"])
      else
        Trip.all
      end
    end
end