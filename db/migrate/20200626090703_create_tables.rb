class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
    	t.string :status
    	t.integer :person
     	t.timestamps
    end
  end
end
