# frozen_string_literal: true

Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'],
  secret_key: ENV['SECRET_KEY'],
  endpoint_secret: ENV['WEBHOOK_SECRET']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]