class WebhooksController < ApplicationController
  # disable CSRF checking
  skip_before_action :verify_authenticity_token

  def create
    # receive POST from Stripe or another third party
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = ENV['STRIPE_WEBHOOK_SECRET']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      render json: {message: e}, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      render json: {message: e}, status: 400
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      checkout_session = event.data.object 
      if current_or_guest_user.guest == false
        Order.create(status: checkout_session.payment_status, user_id: current_or_guest_user.id, stripe_id: checkout_session.payment_intent, amount: checkout_session.amount_total, city: checkout_session.shipping.address.city, country: checkout_session.shipping.address.country, line1: checkout_session.shipping.address.line1, line2: checkout_session.shipping.address.line2, postal_code: checkout_session.shipping.address.postal_code, state: checkout_session.shipping.address.state)
        puts 'Checkout session was successful by a registered user!'
      elsif current_or_guest_user.guest == true
        Order.create(status: checkout_session.payment_status, user_id: current_or_guest_user.id, stripe_id: checkout_session.payment_intent, amount: checkout_session.amount_total, city: checkout_session.shipping.address.city, country: checkout_session.shipping.address.country, line1: checkout_session.shipping.address.line1, line2: checkout_session.shipping.address.line2, postal_code: checkout_session.shipping.address.postal_code, state: checkout_session.shipping.address.state)
        puts 'Checkout session was successful by a guest user!'
      end
    else
      puts "Unhandled event type: #{event.type}"
    end

    render json: { message: 'success' }
  end
end