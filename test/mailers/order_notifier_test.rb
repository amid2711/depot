require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
#    Rails.logger.info "test111"
 
    mail = OrderNotifier.received(orders(:one))
    
    assert_equal "Submit order in Pragmatic Store", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["dvyalkov2711@gmail.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end


  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "You order in Pragmatic Store is shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["dvyalkov2711@gmail.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end
end

