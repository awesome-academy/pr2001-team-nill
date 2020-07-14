# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :booking_dishes
  scope :sort_by_created_at, ->{order created_at: :desc}
  validates :category_id , presence: true
end
