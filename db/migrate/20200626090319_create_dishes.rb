# frozen_string_literal: true

class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :money
      t.string :image_dish
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
