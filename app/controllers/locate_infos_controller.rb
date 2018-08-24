class LocateInfosController < ApplicationController

  def index
    @locate_infos = LocateInfo.all
    render json: @locate_infos
    puts @locate_infos
  end

  def create
    puts "testtest"
    locate_info = LocateInfo.new(create_params)

    # エラー処理
    unless locate_info.save # もし、memoが保存できなかったら
      @error_message = [memo.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    end
  end

  private
  def create_params
    params.require(:locate).permit(:ido, :keido)
  end
end
