class OrderMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_email(order, user)
    @order = order
    @user = user
    mail(to: @order.email, subject: 'Your order #{@order.id} successfully processed')
  end

end
