class AdminUsersController < ApplicationController
  def create
    user = User.find_by(email: params[:admin][:email])

    if user && user.password_digest == params[:admin][:password]
      render json: user
    else
      head 403
    end
  end

  private
  def create_params
    params.require(:admin).permit(:email, :password)
  end
end


