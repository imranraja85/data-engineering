require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "requires a name" do
    merchant = Merchant.create(address: '123 abc lane')

    assert_equal merchant.errors.messages, {:name=>["can't be blank"]}
  end

  test "requires a address" do
    merchant = Merchant.create(name: 'abc store')

    assert_equal merchant.errors.messages, {:address=>["can't be blank"]}
  end
end
