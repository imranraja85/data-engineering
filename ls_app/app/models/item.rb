class Item < ActiveRecord::Base
  belongs_to :merchant

  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :merchant_id, presence: true
end
