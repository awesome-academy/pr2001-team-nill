# frozen_string_literal: true

class CreateBookingTables < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_tables do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.integer :person_bk
      t.timestamps
    end
  end
end
