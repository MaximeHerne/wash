class OrderMailer < ActionMailer::Base
  default from: "contact@washed.fr"

  def new_order(order)
    @order = order

   mail(to: @order.user.email, subject: 'Nouvelle commande confirmée')
  end
end