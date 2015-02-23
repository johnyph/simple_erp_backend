class Api::V1::SessionsController < ApplicationController
	def create
    user_password = params[:password]
    user_email = params[:username]
    user = user_email.present? && User.find_by(email: user_email)
    
    if user && (user.valid_password? user_password)
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: { access_token: user.auth_token, id: user.id, token_type: 'bearer' }, status: 200, location: [:api, user]
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.auth_token = user.generate_authentication_token!
    user.save
    head 204
  end
end
