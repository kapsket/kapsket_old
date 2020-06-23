class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin?



    def is_admin?
      #SI le user n'est pas admin, on le redirige vers l'accueil
      unless current_user.is_admin == true
        flash[:alert] = "Admin access denied"
        redirect_to root_path
      end
  
    end
end
