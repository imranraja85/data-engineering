class Merchant < ActiveRecord::Base
  has_many :items
  has_many :purchases

  validates :name, presence: true
  validates :address, presence: true
end
