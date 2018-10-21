class ResultMessagesController < ApplicationController
  def update
    @result_message = ResultMessage.find_or_initialize_by(locate_info_id: create_params[:locate_info_id])
    if @result_message.update(create_params)
      render @result_message
    else
      render json:@error_message = [@push_info.errors.full_messages].compact
    end
  end


  private 

  def create_params
    params.require(:result_messages).permit(:result_message, :locate_info_id)
  end
end
