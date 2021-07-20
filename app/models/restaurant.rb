class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :staffs, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
