# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_dishes
  has_many :book_tables
end
