# frozen_string_literal: true

module User
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in

    # POST /resource/sign_in

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.

    protected

    def sign_in_params
      params.require(:user).permit(:iduff, :password, :password_confirmation)
    end

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:iduff])
    end
  end
end
