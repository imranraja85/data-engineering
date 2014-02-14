require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "item requires a description" do
    item = Item.create(price: 100, merchant_id: 5)

    assert_equal item.errors.messages, {:description=>["can't be blank"]}
  end

  test "price must be a number" do
    item = Item.create(price: "$25", description: '2 tickets for $25 deal', merchant_id: 5)

    assert_equal item.errors.messages, {:price=>["is not a number"]}
  end

  test "mercant is required" do
    item = Item.create(price: "25", description: '2 tickets for $25 deal')

    assert_equal item.errors.messages, {:merchant_id=>["can't be blank"]}
  end
end
