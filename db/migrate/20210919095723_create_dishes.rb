class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
