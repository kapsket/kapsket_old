module CurrentCart

    private 

    def set_cart
        @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
        current_or_guest_user.id = @cart.user_id
    end
end    