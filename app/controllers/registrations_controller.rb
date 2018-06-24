class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :fullname, :email, :password, :password_confirmation, :role)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :fullname,:description, :phone_number, :email, :password, :password_confirmation, :role)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end