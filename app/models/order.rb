class Order < ApplicationRecord
    has_one :cart

    # after_create :order_confirmation_send

    def order_confirmation_send 
        OrderMailer.order_confirmation(self).deliver_now
      end

end
