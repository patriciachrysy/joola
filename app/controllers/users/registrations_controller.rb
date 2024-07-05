# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # POST /resource
  def create
    super do |resource|
      if params[:user][:roles].present?
        resource.roles = Role.where(id: params[:user][:roles])
      end
    end
  end

  # PUT /resource
  def update
    super do |resource|
      if params[:user][:roles].present?
        resource.roles = Role.where(id: params[:user][:roles])
      end
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :birthdate, :username, :phonenumber, role_ids: []])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :birthdate, :username, :phonenumber, role_ids: []])
  end
end
