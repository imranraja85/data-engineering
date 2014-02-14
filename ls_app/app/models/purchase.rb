class Purchase < ActiveRecord::Base
  belongs_to :item
  belongs_to :merchant
  belongs_to :customer

  def total
    quantity * item.price    
  end
end
