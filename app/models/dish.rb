class Dish < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :menu_dishes, dependent: :destroy
  has_many :menus, through: :menu_dishes
  has_many :images
  mount_uploader :image, ImageUploader
  
  scope :search_name, ->(name) do 
    where("name LIKE '%#{name}%'")
  end

  scope :order_by_created_at, ->(sort_key) do
    order(created_at: sort_key)
  end
end
