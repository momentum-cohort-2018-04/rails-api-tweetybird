class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::MimeResponds
  before_action :verify_authentication
  helper_method :current_user
 
  def current_user    
    # if the session is not empty...
    if session[:user_id]
      # if I have the variable @user use that if not set it to this...
      @user ||= User.find(session[:user_id])
      return @user
    end
  end

  def verify_authentication
    user = authenticate_with_http_token do |token, options|
      User.find_by(api_token: token)
    end

    unless user
      render json: { error: "You do not have permission to access these resources" }, status: :unauthorized
    end
  end

end
