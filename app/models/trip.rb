class Trip < ApplicationRecord

	belongs_to :user
    has_many :lists, dependent: :destroy

  enum checking_finish: {not_finish: 0, finished: 1}

end
