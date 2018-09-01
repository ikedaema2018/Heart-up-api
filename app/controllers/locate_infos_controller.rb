class LocateInfosController < ApplicationController

  def index
    @locate_info = LocateInfo.all
    render json: @locate_info
  end

  def create
    puts params["auth_token"]

    @locate_info = LocateInfo.new(create_params)

    # エラー処理
    unless @locate_info.save # もし、memoが保存できなかったら
      render json:@error_message = [memo.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    else
      render json: @locate_info
    end
  end

  private
  def create_params
    params.require(:locate).permit(:ido, :keido, :nayami).merge(user_id: @user.id)
  end
end
