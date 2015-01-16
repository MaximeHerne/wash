class OrderMailer < ActionMailer::Base
  default from: "contact@washed.fr"

  def new_order(order)
    @order = order
    mail( to: @order.user.email,
          bcc: "contact@washed.fr" ,
          subject: 'Nouvelle commande confirmée')
  end
end