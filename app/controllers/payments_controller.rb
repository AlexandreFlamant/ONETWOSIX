class PaymentsController < ApplicationController

  def create
    # create sponsored_combo
    set_sponsored_combo

    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )

    # run the payment for the sponsored_combo
    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @sponsored_combo.price_cents,
      description:  "Payment for Sponsored Combo Number ##{@sponsored_combo.id}",
      currency:     @sponsored_combo.price.currency
    )

    @sponsored_combo.update(payment: charge.to_json, state: 'paid')
    # update user sponsor_status to true
    @sponsored_combo.user.sponsor_status = true
    @sponsored_combo.user.save

    # update the combo if payment successful
    create_combo


    rescue Stripe::CardError => e
      flash[:alert] = e.message
      render 'combos/new'
  end

  private

    def set_sponsored_combo
      @sponsored_combo = SponsoredCombo.create(user: current_user, state: 'pending')
    end

    def create_combo
      @movie = Movie.find_by_name(params[:combo][:movie])
      @restaurant = Restaurant.find_by_name(params[:combo][:restaurant])
      params[:combo].delete(:movie)
      params[:combo].delete(:restaurant)
      @combo = Combo.new(combo_params)
      @combo.movie = @movie
      @combo.restaurant = @restaurant
      if @combo.save
        @sponsored_combo.combo = @combo
        if @sponsored_combo.save
          flash[:notice] = 'Your payment was successful!'
          redirect_to profile_path
        else
          @sponsored_combo.destroy
          render 'combos/new'
        end
      elsif Combo.where(movie: @movie, restaurant: @restaurant).any?
        set_combo_pair.update(name: params[:combo][:name], description: params[:combo][:description])
        @sponsored_combo.combo = set_combo_pair
        if @sponsored_combo.save
          flash[:notice] = 'Your payment was successful!'
          redirect_to profile_path
        else
          @sponsored_combo.destroy
          render 'combos/new'
        end
      else
        render 'combos/new'
      end
    end

    def combo_params
      params.require(:combo).permit(:name, :description, :movie, :restaurant)
    end

    def set_combo_pair
      Combo.where(movie: @movie, restaurant: @restaurant).first
    end

end
