class CloserAlertsController < ApplicationController
  def user_alert
    @alert = CloserAlert.where(user_id: @user.id).where(close_flag: false)
    render json: @alert
  end

  def fix_closer
    @id = params[:id]
    @closer_alert = CloserAlert.find(@id)
    @closer_alert.update(close_flag: true)
    render json: @closer_alert
  end
end
