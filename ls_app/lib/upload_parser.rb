require 'csv'
#this parser is kinda of outside the domain logic of the app. lets parse it here
class UploadParser
  attr :data

  def initialize#(data)
    #@data = data
  end

  def process
    total = 0.0
    CSV.read("example_input.tab", {headers: true, col_sep: "\t", header_converters: :symbol}).each do |row|
      customer = add_customer(row[:purchaser_name])
      item     = add_item(row[:item_description], row[:item_price])
      merchant = add_merchant(row[:merchant_name], row[:merchant_address])

      #merchant.add_line_item(customer, item, quantity)
      total += row[:item_price].to_f * row[:purchase_count].to_f
    end
    total
  end

  def add_customer(name)
    Customer.find_or_create_by_name(name)
  end

  def add_item(item_description, price)
    Item.find_or_create_by_description(item_description).update_attribute(:price, price)
  end

  def add_merchant(name, address)
    Merchant.find_or_create_by_name_and_address(name, address)  
  end
end
