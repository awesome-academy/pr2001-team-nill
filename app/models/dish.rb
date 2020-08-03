# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :category
  #has_many :comments
  has_many :book_dishes, dependent: :destroy
  has_many :menu_dishes, dependent: :destroy
  has_many :menus, through: :menu_dishes
end
