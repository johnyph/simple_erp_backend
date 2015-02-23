module Authenticable

  # Devise methods overwrite
  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization'] # <= env
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def current_user
    @current_user ||= User.find_by(auth_token: bearer_token)
  end

  def current_organization
  	@current_user.organization
  end

  def authenticate_with_token!
    render json: { errors: 'Δεν έχει ταυτοποιηθεί απο το σύστημα' },
                status: :unauthorized unless current_user.present?
  end
end