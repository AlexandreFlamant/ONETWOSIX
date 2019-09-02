class PaymentsController < ApplicationController
  before_action :set_sponsored_combo

  def new
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @sponsored_combo.price_cents,
      description:  "Payment for #{@sponsored_combo.combo.name} for Sponsored Combo Number ##{@sponsored_combo.id}",
      currency:     @sponsored_combo.price.currency
    )

    @sponsored_combo.update(payment: charge.to_json, state: 'paid')
    redirect_to profile_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_sponsored_combo_payment_path(@sponsored_combo)
  end

private

  def set_sponsored_combo
    @sponsored_combo = SponsoredCombo.find(params[:sponsored_combo_id])
  end

end
