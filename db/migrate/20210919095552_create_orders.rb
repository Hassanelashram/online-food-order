class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.time :pickup_time
      t.decimal :price
      t.string :customer_email
      t.string :customer_name
      t.string :status, default: "processing"
      t.datetime :food_ready_at

      t.timestamps
    end
  end
end
