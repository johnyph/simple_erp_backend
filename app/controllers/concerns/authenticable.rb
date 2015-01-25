module Authenticable

  # Devise methods overwrite
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: 'Δεν έχει ταυτοποιηθεί απο το σύστημα' },
                status: :unauthorized unless current_user.present?
  end
end