module CurrentCart

    private 

    def set_cart
        print(session[:cart_id])
        @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        print("IM THEEEEEEEEEEEEERRRRRRRRRRRRRRRRRRREEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
        @cart = Cart.create()
        session[:cart_id] = @cart.id
    end
end    