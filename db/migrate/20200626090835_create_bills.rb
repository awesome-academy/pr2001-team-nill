class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
    	t.integer :cost_price
    	t.references :table, null: false, foreign_key: true
    	t.date :bill_date
    	t.timestamps
    end
  end
end
