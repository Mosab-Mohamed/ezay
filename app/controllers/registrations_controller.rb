class RegistrationsController < Devise::RegistrationsController # extends devise resgisterations 

	def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :department)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :department)
  end

end

