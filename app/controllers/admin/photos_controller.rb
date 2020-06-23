class Admin::PhotosController < AdminController

    def create
        @product = Product.find(params[:product_id])
        @product.photos.attach(params[:photos])
        redirect_to(product_path(@product))
      end


    private

        def photos_params
            params.require(:product).permit(:name, :price, :description, :stock, photos:[])
          end

end
