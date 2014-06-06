class AdminMailer < ActionMailer::Base
  default from: Setting.email_sender

  def order_compelete_notification(order)
    @order = order
    @emails = Setting.admin_emails
    @link = order_url(@order) #TODO this should be admin order url
    @emails.each do |email|
      mail(to: email, subject: "Order:#{@order.id} 已成立，請盡快出貨。")
    end
  end

end
