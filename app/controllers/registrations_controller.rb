class RegistrationsController < Devise::RegistrationsController

    def create
        super
        current_or_guest_user
      end

  private 

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :guest)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :current_password)
    end

  
end
