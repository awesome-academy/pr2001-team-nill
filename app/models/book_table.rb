# frozen_string_literal: true

class BookTable < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :table
end
