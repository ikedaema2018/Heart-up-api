class ShabonAlertsController < ApplicationController
  def show
    @shabon_alert = ShabonAlert.joins(:locate_info).merge(LocateInfo.where(user_id: @user.id))
    @shabon_alert = @shabon_alert.where(splash: false)
    render json: @shabon_alert
  end

  def fix_alert
    @id = params[:id]
    @shabon_alert = ShabonAlert.find(@id)
    @shabon_alert.update(splash: true)
    render json: @shabon_alert
  end
end
