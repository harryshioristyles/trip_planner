class Trip < ApplicationRecord

	belongs_to :user

    has_many :lists, ->{order(:day_index, :begin)}, dependent: :destroy
    has_many :favorite_trips, dependent: :destroy
    has_many :tags, through: :trip_tags
    has_many :trip_tags, dependent: :destroy

    has_one_attached :trip_image

    enum checking_finish: {not_finish: 0, finished: 1}

    def favorited_by?(user)
       favorite_trips.where(user_id: user.id).exists?
    end

    def self.search(search)
      if search
        Trip.where(['trip_title LIKE ?', "%#{search}%"])
      else
        Trip.all
      end
    end
end