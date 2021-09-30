class CreateDishItems < ActiveRecord::Migration[6.1]
  def change
    create_table :dish_items do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
