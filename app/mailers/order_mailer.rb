class OrderMailer < ActionMailer::Base
  default from: "example@artstore.dev"

  def compelete_notification(order, email)
    @order = order
    @email = email
    @link = order_url(@order)
    mail(to: email, subject: "您的Artstore訂單已成立，我們將盡快為您出貨。")
  end
end
