class ChargesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @post = Post.find params[:post_id]
    # Amount in cents
    @amount = 1000

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@amount * 1.5).to_i,
      :description => 'Print of ' + @post.title,
      :currency    => 'usd'
    )

    # below here
    flash[:notice] = 'Payment succeeded'
    # Order.create(user: current_user, amount: @amount, post: @post)
    redirect_to '/posts'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to post_path(@post)
  end

end
