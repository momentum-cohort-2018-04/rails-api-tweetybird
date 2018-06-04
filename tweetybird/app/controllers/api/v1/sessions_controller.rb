class Api::V1::SessionsController < ApplicationController
    skip_before_action :verify_authentication

    def create
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:api_token] = user.api_token
            render json: { token: user.api_token }
        else
            render json: { error: "Invalid credentials" }, status: 401
        end
    end

end
