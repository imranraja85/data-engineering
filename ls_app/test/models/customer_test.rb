require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "customer requires a name" do
    customer = Customer.create

    assert customer.errors.messages == {:name=>["can't be blank"]}
  end
end
