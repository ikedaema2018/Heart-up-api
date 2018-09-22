class PushInfosController < ApplicationController

  def save_token
    @push_info = PushInfo.find_or_initialize_by(user_id: create_params[:user_id])
    if @push_info.update(create_params)
      render @push_info
    else
      render json:@error_message = [@push_info.errors.full_messages].compact
    end
  end

  private

    def create_params
      params.require(:push_infos).permit(:fcm_token, :user_id)
    end
end
