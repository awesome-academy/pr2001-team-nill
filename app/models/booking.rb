class Book < ApplicationRecord
	has_many :booking_dishes
	has_many  :booking_tables
end
