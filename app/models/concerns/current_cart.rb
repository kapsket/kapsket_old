module CurrentCart

    private 

    def set_cart
        @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        @cart = Cart.create(user_id: current_or_guest_user.id)
        session[:cart_id] = @cart.id
    end
end    