class ChargesController < ApplicationController
    def new
      @stripe_btn_data = {
          key: "#{ Rails.configuration.stripe[:publishable_key]}",
          description: "Premium Membership - #{current_user.email}",
          amount: 5_00
      }
    end   
   
   def create
        # Creates a Stripe Customer object, for associating
        # with the charge
        customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
        )
    
    
          subscription = Stripe::Subscription.create(
              :customer => customer.id,
              :plan => 'premium',
          )
          current_user.update_attributes(stripe_id: customer.id)
          current_user.update_attributes(stripe_subscription: subscription.id)
          current_user.update_attributes(role: 'premium')
      
          flash[:notice] = "Welcome to premium, #{current_user.email}! Start creating private wikis today."
          redirect_to wikis_path
    
        # Stripe will send back CardErrors, with friendly messages
        # when something goes wrong.
        # This `rescue block` catches and displays those errors.
        rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path
    end


  def delete
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    subscription = Stripe::Subscription.retrieve(current_user.stripe_subscription )
    subscription.delete
    current_user.update_attributes(role: 'standard')
    current_user_downgrade_wikis
    redirect_to edit_user_registration_path
    flash[:notice] = "Membership downgraded. Boo."
  end
end