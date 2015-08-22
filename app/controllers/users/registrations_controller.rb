class Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :department, :email, :password, :password_confirmation , :photo)
  end

  def account_update_params
    params.require(:user).permit(:name, :department, :email, :password, :password_confirmation, :current_password,:photo)
  end


end
