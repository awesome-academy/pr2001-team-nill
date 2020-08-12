# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_tables
  has_many :table, through: :book_tables
  accepts_nested_attributes_for :book_tables
end
