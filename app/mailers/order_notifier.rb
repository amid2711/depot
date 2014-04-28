class OrderNotifier < ActionMailer::Base
  default from: "dvyalkov2711@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: @order.email, subject: 'Submit order in Pragmatic Store'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: @order.email, subject: 'You order in Pragmatic Store is shipped'
  end
end
