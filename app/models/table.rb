# frozen_string_literal: true

class Table < ApplicationRecord
  has_many :book , through: :book_tables
end
