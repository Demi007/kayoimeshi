class Image < ApplicationRecord
  belongs_to :restaurant
  attachment :img
end
