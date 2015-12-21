class ChargesController < ApplicationController
	def new

	end

	def create
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'jpy'
	  )

	  @analytics_purchase = AnalyticsPurchase.new(:user_session => params[:user_session], :product_id => params[:product_id])
	  @analytics_purchase.save

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

end
