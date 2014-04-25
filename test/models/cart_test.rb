require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "add unique products in cart" do
  	cart = Cart.create
  	cart.add_product(products(:ruby).id).save
  	cart.add_product(products(:world).id).save
  	assert_equal 2, cart.line_items.count
  end

test "add duplicate products in cart" do
  	cart = Cart.create
  	cart.add_product(products(:world).id).save
  	cart.add_product(products(:world).id).save
  	assert_equal 1, cart.line_items.count
  end

end
