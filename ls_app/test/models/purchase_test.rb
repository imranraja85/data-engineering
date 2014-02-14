require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  test "returns the total purchase amount" do
    purchase = Purchase.new(quantity: 5)
    purchase.stubs(:item).returns(stub(:price => 3.50))

    assert_equal purchase.total, 17.5
  end
end
