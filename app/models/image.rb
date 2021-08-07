class Image < ApplicationRecord
  belongs_to :restaurant
  has_many :tags, dependent: :destroy
  attachment :img
end
