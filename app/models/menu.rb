# frozen_string_literal: true

class Menu < ApplicationRecord
	has_many :menu_dishes
  has_many :dishes, through: :menu_dishes
  accepts_nested_attributes_for :menu_dishes
end
