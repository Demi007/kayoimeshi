class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :staffs, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(keyword)
    if keyword# Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Restaurant.where(['address LIKE ?', "%#{keyword}%"])
    else
      Restaurant.all #全て表示。
    end
  end
  
end
