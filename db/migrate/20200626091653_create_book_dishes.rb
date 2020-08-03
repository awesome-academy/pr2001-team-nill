# frozen_string_literal: true

class CreateBookDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :book_dishes do |t|
      t.references :book, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
      t.timestamps
    end
  end
end
