# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :booking_dishes
end
