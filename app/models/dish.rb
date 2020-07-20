class Dish < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :booking_dishes
  has_many :images
  mount_uploader :image, ImageUploader
end
