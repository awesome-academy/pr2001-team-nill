# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :booking_dishes
  default_scope -> { order(created_at: :desc) }
  validates :category_id , presence: true
end
