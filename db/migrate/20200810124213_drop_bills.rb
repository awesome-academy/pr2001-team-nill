class DropBills < ActiveRecord::Migration[6.0]
  def change
    drop_table :bills
  end
end
