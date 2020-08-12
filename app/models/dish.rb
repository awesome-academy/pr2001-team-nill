class Dish < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :menu_dishes, dependent: :destroy
  has_many :menus, through: :menu_dishes
  has_many :images, dependent: :destroy
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :images
  scope :search_name, lambda { |name|
    where("name LIKE '%#{name}%'")
  }

  scope :order_by_created_at, lambda { |sort_key|
    order(created_at: sort_key)
  }
end
