# frozen_string_literal: true

class BookDetail < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :dish
end
