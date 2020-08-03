# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :money
      t.timestamps
    end
  end
end
