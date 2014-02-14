class PurchasesUpload < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :upload
end
