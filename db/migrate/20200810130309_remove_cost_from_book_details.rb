class RemoveCostFromBookDetails < ActiveRecord::Migration[6.0]
  def change

    remove_column :book_details, :cost, :integer
  end
end
