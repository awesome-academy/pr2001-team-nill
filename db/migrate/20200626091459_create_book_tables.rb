# frozen_string_literal: true

class CreateBookTables < ActiveRecord::Migration[6.0]
  def change
    create_table :book_tables do |t|
      t.references :book, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.timestamps
    end
  end
end
