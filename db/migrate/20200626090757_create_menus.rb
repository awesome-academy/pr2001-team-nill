class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
    	t.string :name
    	t.references :dish, null: false, foreign_key: true
     	t.timestamps
    end
  end
end
