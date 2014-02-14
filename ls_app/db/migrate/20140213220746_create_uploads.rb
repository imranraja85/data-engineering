class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename    
      t.decimal :gross_revenue    
      t.integer :purchases_count    

      t.timestamps
    end
  end
end
