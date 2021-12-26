class CheckoutController < ApplicationController
    def create
        cart = Cart.find(params[:id])
        line_items_array = []
        cart.line_items.each do |line_item|
        line_items_array << {
            name: line_item.product.name,
            description: line_item.product.description,
            amount: line_item.product.price.to_i*100,
            currency: 'eur',
            quantity: line_item.quantity,
        }
        end

        if cart.nil?
            redirect_to root_path
            return
        end

        # Setting up a Stripe session for payment. 
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            shipping_address_collection: {
            allowed_countries: ['FR', 'BE'],},
            shipping_options: [
                {
                  shipping_rate_data: {
                    type: 'fixed_amount',
                    fixed_amount: {
                      amount: 0,
                      currency: 'eur',
                    },
                    display_name: 'Free shipping',
                    # Delivers between 5-7 business days
                    delivery_estimate: {
                      minimum: {
                        unit: 'business_day',
                        value: 5,
                      },
                      maximum: {
                        unit: 'business_day',
                        value: 10,
                      },
                    }
                  }
                },],
            line_items: line_items_array,
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url
        )

        respond_to do |format|
            format.js # render create.js.erb
        end
    end

    def cancel
    end

    def success
    end

end
