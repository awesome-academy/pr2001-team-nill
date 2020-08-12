class AddCostToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :cost, :integer, default: 0
  end
end
