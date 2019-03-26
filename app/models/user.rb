class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validates :nickname, presence: true, length: { in: 2..20 }
	validates :introduction, length: { maximum: 150 }

	has_many :trips, dependent: :destroy
	has_many :favorite_trips, dependent: :destroy

	has_one_attached :user_image

end