class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to Jungle')
  end

  def order_receipt(order)
    @order = order
    @url  = 'http://localhost:3000/'
    mail(to: @order.email, 
         subject: "Thank you for your order #{@order.id}",
         template_path: 'user_mailer',
         template_name: 'receipt'
         )
  end
end


