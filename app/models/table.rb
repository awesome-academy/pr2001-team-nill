# frozen_string_literal: true

class Table < ApplicationRecord
  has_many :book_tables
  has_many :bill
end
