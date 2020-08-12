# frozen_string_literal: true

class CreateBookDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :book_details do |t|
      t.references :book, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
      t.integer :cost
      t.timestamps
    end
  end
end
