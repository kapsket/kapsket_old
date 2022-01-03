class OrderMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'
 
  def order_confirmation(order)
    @order = order

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @order.email, subject: 'Merci pour votre commande') 
  end
end