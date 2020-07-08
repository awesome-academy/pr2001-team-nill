# frozen_string_literal: true

class Table < ApplicationRecord
  has_many :booking_tables
  has_many :bill
end
