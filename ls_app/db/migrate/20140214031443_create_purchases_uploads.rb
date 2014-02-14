class CreatePurchasesUploads < ActiveRecord::Migration
  def change
    create_table :purchases_uploads do |t|
      t.integer :purchase_id    
      t.integer :upload_id    
    end
  end
end
