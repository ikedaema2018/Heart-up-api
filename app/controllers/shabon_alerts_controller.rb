class ShabonAlertsController < ApplicationController
  def show
    @shabon_alert = ShabonAlert.joins(:locate_info).merge(LocateInfo.where(user_id: @user.id))
    p @shabon_alert
  end
end
