# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def sign_up_params
    params.require(:user).permit(:email, :password, :name, :phone)
  end

  def user_params
    params.require(:user).permit(:email, :password, :phone, :current_password, :status)
  end
  private

def respond_with(resource, options = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully.',
        data: resource }
      }, status: :ok
    else
      render json: {
        status: {message: "User couldn't be created successfully.", 
          errors: resource.errors.full_messages }, 
        status: :unprocessable_entity 
      }
    end
  end
end
