class Upload < ActiveRecord::Base
  has_many :purchases_uploads
  has_many :purchases, :through => :purchases_uploads

  attr_accessor :uploaded_file

  def process
    set_filename
    save_file
    process_file

    self
  end

  def set_filename
    self.filename = uploaded_file.original_filename    
  end

  def save_file
    File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end
  end

  def process_file
    gross_revenue = 0

    CSV.read(full_path, {headers: true, col_sep: "\t", header_converters: :symbol}).each do |row|
      customer = Customer.find_or_create_by(name: row[:purchaser_name])
      merchant = Merchant.find_or_create_by(name: row[:merchant_name], address: row[:merchant_address])
      item     = merchant.items.find_or_create_by(description: row[:item_description], price: row[:item_price])

      purchase = purchases.create(item: item, quantity: row[:purchase_count], customer: customer, merchant: merchant)
      gross_revenue += purchase.total
    end

    update_attributes(purchases_count: purchases.count, gross_revenue: gross_revenue)
  end

  def full_path
    Rails.root.join('public', 'uploads', filename)
  end

  def local_path
    "/uploads/#{filename}"
  end

  def file_contents
    File.read(full_path)   
  end
end
