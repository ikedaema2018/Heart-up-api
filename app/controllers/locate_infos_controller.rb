class LocateInfosController < ApplicationController

  def index
    @locate_infos = LocateInfo.all
    p @locate_infos
    render json: @locate_infos
  end

  def create

    @locate_info = LocateInfo.new(create_params)

    # エラー処理
    unless @locate_info.save # もし、memoが保存できなかったら
      render json:@error_message = [@locate_info.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    else
      render json: @locate_info
    end
  end

  def show
    @id = params[:id]
    @locate_info = LocateInfo.find(@id)
    render json: @locate_info
  end

  private
  def create_params
    params.require(:locate).permit(:ido, :keido, :nayami).merge(user_id: @user.id)
  end
end
