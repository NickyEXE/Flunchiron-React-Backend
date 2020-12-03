class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    token = encode_token(user.id)
    render json: {user: user, token: token}
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
