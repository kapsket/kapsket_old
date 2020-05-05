class ImagesController < ApplicationController

    def create
        @cap = Cap.find(params[:cap_id])
        @cap.images.attach(params[:images])
        redirect_to(cap_path(@cap))
      end


    private

        def images_params
            params.require(:cap).permit(:name, :company, images:[])
          end

end
