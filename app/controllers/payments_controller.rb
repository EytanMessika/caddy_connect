class PaymentsController < ApplicationController
  def premium
  end

  def create
    @amount_cents = 1500

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @amount_cents, # in cents
      description:  "Payment for user #{current_user.id}",
      currency:     'eur'
    )

    current_user.update(payment: charge.to_json, premium: true)
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to premium_path
  end
end
