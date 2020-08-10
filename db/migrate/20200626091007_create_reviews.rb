class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      f.text :name
      t.float :rate
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    
  end
end
