# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private
  def respond_with(resource, options = {})
    render json: {
      status: { 
        code: 200, message: 'User signed in successfully.',
        data: {user: current_user, phone: current_user.phone} 
      }
    }, status: :ok
  end
  def respond_to_on_destroy
     
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
     
      current_user = User.find(jwt_payload['sub'])
    
    if current_user
      render json: {
        status: 200,
        message: 'Signed out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "User Couldn't find an active session."
      }, status: :unauthorized
    end
  end

end
