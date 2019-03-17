class Trip < ApplicationRecord

	belongs_to :user

    has_many :lists, ->{order(:day_index, :begin)}, dependent: :destroy
    has_many :favorite_trips, dependent: :destroy
    has_many :trip_tags, dependent: :destroy
    has_many :tags, through: :trip_tags


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

  def save_tags(tags)
    current_tags = self.tags.pluck(:tag) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_tag|
      self.tags.delete Tag.find_by(tag:old_tag)
    end

    # Create new taggings:
    new_tags.each do |new_tag|
      trip_tag = Tag.find_or_create_by(tag:new_tag)
      self.tags << trip_tag
    end
  end

end