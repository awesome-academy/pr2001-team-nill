# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_tables
  has_many :book_details
  has_many :table , through: :book_tables
  has_many :dish , through: :book_details
end
