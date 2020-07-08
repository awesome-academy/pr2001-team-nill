# frozen_string_literal: true

class BookDish < ApplicationRecord
  belongs_to :book
  belongs_to :dish
end
