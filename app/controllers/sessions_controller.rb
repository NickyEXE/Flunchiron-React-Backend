class SessionsController < ApplicationController
  before_action :set_current_user, only: [:autologin]

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = encode_token(user.id)

      render json: {user: UserSerializer.new(user), token: token}
    else
      render json: {error: "Incorrect Username or Password!"}
    end
  end

  def autologin
    if @current_user
      render json: {user: UserSerializer.new(@current_user)}
    end
  end
end
