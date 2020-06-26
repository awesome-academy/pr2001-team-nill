# frozen_string_literal: true

class CreateBookingDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_dishes do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
      t.timestamps
    end
  end
end
