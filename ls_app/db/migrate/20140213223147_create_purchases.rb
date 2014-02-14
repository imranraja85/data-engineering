class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :item_id
      t.integer :quantity
      t.integer :customer_id
      t.integer :merchant_id
      t.integer :upload_id

      t.timestamps
    end
  end
end
