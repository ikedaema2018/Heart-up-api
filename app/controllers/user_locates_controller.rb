class UserLocatesController < ApplicationController
  def update
    @user_locate = UserLocate.find_or_initialize_by(user_id: @user.id)
    if @user_locate.update(user_locate_params)
      render json: @user_locate
    else
      head 500
    end
  end


  private
    def user_locate_params
      params.require(:user_locate).permit(:ido, :keido).merge(user_id: @user.id)
    end
end
